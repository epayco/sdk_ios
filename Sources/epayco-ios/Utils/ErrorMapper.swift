import Foundation

/// Mapeador de códigos de estado HTTP a mensajes descriptivos
/// Similar al sistema de errores usado en PHP
public struct ErrorMapper {
    
    /// Mapea HTTP status codes a mensajes descriptivos
    /// Siguiendo el patrón usado en PHP
    public static func mapStatusCodeToMessage(_ statusCode: Int) -> String {
        switch statusCode {
        case 200...206:
            return "Solicitud exitosa"
            
        case 400:
            return "Solicitud incorrecta, por favor verifica los datos enviados"
        case 401:
            return "No autorizado, revisa tus credenciales"
        case 403:
            return "Acceso prohibido, no tienes permisos para esta acción"
        case 404:
            return "La ruta en la que estás realizando la petición no existe"
        case 405:
            return "Método no permitido en esta ruta"
        case 408:
            return "Tiempo de espera agotado"
        case 429:
            return "Demasiadas solicitudes, por favor intenta más tarde"
            
        case 500:
            return "Error interno del servidor"
        case 503:
            return "Servicio no disponible, intenta más tarde"
        case 500...599:
            return "Error inesperado del servidor (HTTP \(statusCode))"
            
        default:
            return "Error desconocido (HTTP \(statusCode))"
        }
    }
    
    /// Extrae el mensaje de error del JSON response
    /// Intenta múltiples formatos comunes de respuesta de API
    /// Retorna solo el mensaje principal, los detalles están en extractErrorData()
    public static func extractErrorMessage(
        from jsonData: [String: Any]?,
        statusCode: Int
    ) -> String {
        guard let json = jsonData else {
            return mapStatusCodeToMessage(statusCode)
        }
        
        // PRIORIDAD 1: errors al nivel superior
        if let errors = json["errors"] as? String, !errors.isEmpty {
            return errors
        }
        
        // PRIORIDAD 2: data.errors (ESPECÍFICO DE CAMPO - PRIORIDAD ALTA)
        if let data = json["data"] as? [String: Any] {
            // Errors es el MÁS ESPECÍFICO - error de validación de campo exacto
            if let errors = data["errors"] as? String, !errors.isEmpty {
                return "❌ " + errors  // Error específico del campo
            }
            
            // Si errors es un array de strings, unirlos
            if let errorsArray = data["errors"] as? [String], !errorsArray.isEmpty {
                return "❌ Errores: " + errorsArray.joined(separator: " | ")
            }
            
            // Si errors es un diccionario con campos específicos
            if let errorsDict = data["errors"] as? [String: Any], !errorsDict.isEmpty {
                let fieldErrors = errorsDict.map { key, value in
                    "\(key): \(value)"
                }.joined(separator: " | ")
                return "❌ Validación fallida: " + fieldErrors
            }
        }
        
        // PRIORIDAD 3: data.description (descripción general del error)
        if let data = json["data"] as? [String: Any] {
            if let description = data["description"] as? String, !description.isEmpty {
                return description
            }
        }
        
        // PRIORIDAD 4: message principal
        if let message = json["message"] as? String, !message.isEmpty {
            return message
        }
        
        // PRIORIDAD 5: error
        if let error = json["error"] as? String, !error.isEmpty {
            return error
        }
        
        // PRIORIDAD 6: detail (algunos APIs lo usan)
        if let detail = json["detail"] as? String, !detail.isEmpty {
            return detail
        }
        
        return mapStatusCodeToMessage(statusCode)
    }
    
    /// Extrae datos adicionales del error desde el JSON
    /// Devuelve un diccionario con todos los detalles del error
    public static func extractErrorData(from jsonData: [String: Any]?) -> [String: AnyCodable]? {
        guard let json = jsonData else { return nil }
        
        var result: [String: AnyCodable] = [:]
        
        // Obtener el objeto "data" que contiene los detalles
        if let data = json["data"] as? [String: Any] {
            // 1. Incluir status si existe
            if let status = data["status"] {
                result["status"] = .string(String(describing: status))
            }
            
            // 2. Incluir description (descripción general del error)
            if let description = data["description"] as? String, !description.isEmpty {
                result["description"] = .string(description)
            }
            
            // 3. Incluir errors en CUALQUIER formato (es lo MÁS IMPORTANTE)
            if let errors = data["errors"] as? String, !errors.isEmpty {
                result["specific_error"] = .string(errors)  // El error específico
            } else if let errorsArray = data["errors"] as? [String], !errorsArray.isEmpty {
                result["specific_error"] = .string(errorsArray.joined(separator: " | "))
            } else if let errorsDict = data["errors"] as? [String: Any], !errorsDict.isEmpty {
                let errorStrings = errorsDict.map { key, value in
                    "\(key): \(value)"
                }
                result["specific_error"] = .string(errorStrings.joined(separator: " | "))
            }
        }
        
        // También extraer otros campos útiles del nivel superior
        if let detail = json["detail"] {
            result["detail"] = .string(String(describing: detail))
        }
        
        return result.isEmpty ? nil : result
    }
    
    /// Convierte un Dictionary común a [String: AnyCodable]
    private static func convertToDictionary(_ dict: [String: Any]) -> [String: AnyCodable]? {
        var result: [String: AnyCodable] = [:]
        
        for (key, value) in dict {
            if let stringValue = value as? String {
                result[key] = .string(stringValue)
            } else if let intValue = value as? Int {
                result[key] = .int(intValue)
            } else if let boolValue = value as? Bool {
                result[key] = .bool(boolValue)
            } else if let doubleValue = value as? Double {
                result[key] = .double(doubleValue)
            } else if let arrayValue = value as? [Any] {
                // Para arrays, solo lo convertimos a string por ahora
                result[key] = .string(String(describing: arrayValue))
            }
        }
        
        return result.isEmpty ? nil : result
    }
}
