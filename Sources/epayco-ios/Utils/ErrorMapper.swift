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
    /// Accede correctamente al objeto "data" que contiene los detalles
    public static func extractErrorMessage(
        from jsonData: [String: Any]?,
        statusCode: Int
    ) -> String {
        guard let json = jsonData else {
            return mapStatusCodeToMessage(statusCode)
        }
        
        // PRIORIDAD 1: Acceder al objeto "data"
        if let data = json["data"] as? [String: Any] {
            // El "errors" dentro de "data" es el MÁS ESPECÍFICO
            if let errors = data["errors"] as? String, !errors.isEmpty {
                return errors  // Retornar el error específico tal cual
            }
            
            // Si no hay "errors", usar "description"
            if let description = data["description"] as? String, !description.isEmpty {
                return description
            }
        }
        
        // PRIORIDAD 2: errors al nivel superior
        if let errors = json["errors"] as? String, !errors.isEmpty {
            return errors
        }
        
        // PRIORIDAD 3: message principal
        if let message = json["message"] as? String, !message.isEmpty {
            return message
        }
        
        return mapStatusCodeToMessage(statusCode)
    }
    
    /// Extrae datos adicionales del error desde el JSON
    /// Accede al objeto "data" y extrae todos sus valores
    public static func extractErrorData(from jsonData: [String: Any]?) -> [String: AnyCodable]? {
        guard let json = jsonData else { return nil }
        
        var result: [String: AnyCodable] = [:]
        
        // Acceder al objeto "data"
        if let data = json["data"] as? [String: Any] {
            // Extraer cada valor de "data" directamente
            for (key, value) in data {
                if let stringValue = value as? String {
                    result[key] = .string(stringValue)
                } else if let boolValue = value as? Bool {
                    result[key] = .bool(boolValue)
                } else if let intValue = value as? Int {
                    result[key] = .int(intValue)
                } else {
                    result[key] = .string(String(describing: value))
                }
            }
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
