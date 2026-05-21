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
    public static func extractErrorMessage(
        from jsonData: [String: Any]?,
        statusCode: Int
    ) -> String {
        guard let json = jsonData else {
            return mapStatusCodeToMessage(statusCode)
        }
        
        // Intenta formato 1: "message" directo
        if let message = json["message"] as? String, !message.isEmpty {
            print("✅ Mensaje extraído de 'message': \(message)")
            return message
        }
        
        // Intenta formato 2: "errors[0].message"
        if let errors = json["errors"] as? [[String: Any]], 
           let firstError = errors.first,
           let message = firstError["message"] as? String,
           !message.isEmpty {
            print("✅ Mensaje extraído de 'errors[0].message': \(message)")
            return message
        }
        
        // Intenta formato 3: "errors" como array de strings
        if let errors = json["errors"] as? [String], let firstError = errors.first {
            print("✅ Mensaje extraído de 'errors[0]': \(firstError)")
            return firstError
        }
        
        // Intenta formato 4: "error" directo
        if let error = json["error"] as? String, !error.isEmpty {
            print("✅ Mensaje extraído de 'error': \(error)")
            return error
        }
        
        // Intenta formato 5: "description"
        if let description = json["description"] as? String, !description.isEmpty {
            print("✅ Mensaje extraído de 'description': \(description)")
            return description
        }
        
        // Fallback al mapeo por status code
        print("⚠️ No se encontró mensaje en JSON, usando mapeo de status code")
        return mapStatusCodeToMessage(statusCode)
    }
    
    /// Extrae datos adicionales del error desde el JSON
    public static func extractErrorData(from jsonData: [String: Any]?) -> [String: AnyCodable]? {
        guard let json = jsonData else { return nil }
        
        // Intenta obtener el objeto "data"
        if let data = json["data"] as? [String: Any] {
            print("📊 Datos del error extraídos")
            return convertToDictionary(data)
        }
        
        // Si no hay "data", intenta con la raíz misma (excluyendo campos conocidos)
        var resultData: [String: AnyCodable] = [:]
        let excludedKeys = ["status", "message", "error", "errors", "description"]
        
        for (key, value) in json {
            if !excludedKeys.contains(key) {
                if let stringValue = value as? String {
                    resultData[key] = .string(stringValue)
                } else if let intValue = value as? Int {
                    resultData[key] = .int(intValue)
                } else if let boolValue = value as? Bool {
                    resultData[key] = .bool(boolValue)
                } else if let doubleValue = value as? Double {
                    resultData[key] = .double(doubleValue)
                }
            }
        }
        
        return resultData.isEmpty ? nil : resultData
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
