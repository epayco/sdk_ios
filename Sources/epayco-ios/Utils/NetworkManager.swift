import Foundation

public protocol NetworkManagerDelegate {
    var publicKey: String {get set}
    var privateKey: String {get set}
}

public struct NetworkManager<ResponseModel: Decodable> {


    public let url: String
    public let delegate: NetworkManagerDelegate
    
    public init(_ url: String, delegate: NetworkManagerDelegate){
        self.url = url
        self.delegate = delegate
    }
    
    /// Realiza request HTTP y retorna Result con éxito o error mapeado
    /// Mapea HTTP status codes y extrae mensajes de error del JSON
    public func performRequest<T: Encodable>(
        httpMethod: String,
        requestBody: T?,
        isAuthRequired: Bool = true
    ) -> Result<ResponseModel, ErrorResponse> {
        
        guard let url = URL(string: self.url) else {
            return .failure(ErrorResponse(
                status: false,
                message: "URL inválida",
                data: nil,
                status_code: 0
            ))
        }
        
        let semaphore = DispatchSemaphore(value: 0)
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url)
        let requestType = self.url.contains(K.urlBase) ? "sdk-jwt" : "sdk"
        
        var resultData: Data?
        var resultResponse: URLResponse?
        var resultError: Error?
        
        request.httpMethod = httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(requestType, forHTTPHeaderField: "type")
        request.setValue("swift", forHTTPHeaderField: "lang")
        
        if isAuthRequired {
            let authToken = self.url.contains(K.urlBase) ? "Bearer " + authenticate() : "Basic " + Data(delegate.publicKey.utf8).base64EncodedString()
            request.setValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        if httpMethod != "GET" {
            request.httpBody = try? JSONEncoder().encode(requestBody)
        }
        
        let task = session.dataTask(with: request) { (data, response, error) in
            resultData = data
            resultResponse = response
            resultError = error
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        // MANEJO DE ERRORES DE RED
        if let error = resultError {
            let errorMsg = error.localizedDescription
            return .failure(ErrorResponse(
                status: false,
                message: "Error de conexión: \(errorMsg)",
                data: nil,
                status_code: 0
            ))
        }
        
        // OBTENER HTTP STATUS CODE
        guard let httpResponse = resultResponse as? HTTPURLResponse else {
            return .failure(ErrorResponse(
                status: false,
                message: "No se pudo obtener respuesta del servidor",
                data: nil,
                status_code: 0
            ))
        }
        
        let statusCode = httpResponse.statusCode
        
        // CASO EXITOSO (200-206)
        if statusCode >= 200 && statusCode <= 206 {
            if httpMethod == "DELETE" {
                // Para DELETE, consideramos exitoso 204 o 200
                if statusCode == 204 || statusCode == 200 {
                    return .success(ResponseModel.self as! ResponseModel)
                }
            }
            
            // Intentar parsear respuesta
            if let data = resultData, data.count > 0 {
                // Intentar parsear como JSON genérico para validar
                if let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    
                    // Si el JSON tiene "status": false, es un error aunque sea 200
                    if let status = jsonObject["status"] as? Bool, !status {
                        let errorMessage = ErrorMapper.extractErrorMessage(from: jsonObject, statusCode: 200)
                        let errorData = ErrorMapper.extractErrorData(from: jsonObject)
                        
                        // Debug: Imprimir en JSON
                        if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
                           let jsonString = String(data: jsonData, encoding: .utf8) {
                            print(jsonString)
                        }
                        
                        return .failure(ErrorResponse(
                            status: false,
                            message: errorMessage,
                            data: errorData,
                            status_code: 200
                        ))
                    }
                }
                
                do {
                    let decoded = try JSONDecoder().decode(ResponseModel.self, from: data)
                    // Imprimir respuesta exitosa en JSON bonito
                    if let jsonData = try? JSONSerialization.data(withJSONObject: try? JSONSerialization.jsonObject(with: data), options: .prettyPrinted),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)
                    }
                    return .success(decoded)
                } catch let decodingError {
                    // Debug: Error de decodificación - mostrar respuesta cruda
                    if let jsonString = String(data: data, encoding: .utf8) {
                   
                        print("Respuesta del servidor:")
                        print(jsonString)
                        
                    }
                    return .failure(ErrorResponse(
                        status: false,
                        message: "Error al procesar respuesta del servidor: \(decodingError.localizedDescription)",
                        data: nil,
                        status_code: statusCode
                    ))
                }
            }
            return .failure(ErrorResponse(
                status: false,
                message: "Respuesta vacía del servidor",
                data: nil,
                status_code: statusCode
            ))
        }
        
        // CASO ERROR (400-599)
        if statusCode >= 400 && statusCode < 600 {
            var responseBody: [String: Any]?
            var errorMessage: String
            var errorData: [String: AnyCodable]?
            
            // Intenta extraer el body
            if let data = resultData, data.count > 0 {
                if let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    responseBody = jsonObject
                }
            }
            
            // MAPEAR ERROR
            errorMessage = ErrorMapper.extractErrorMessage(from: responseBody, statusCode: statusCode)
            errorData = ErrorMapper.extractErrorData(from: responseBody)
            
            // Imprimir solo el JSON del error
            if let responseBody = responseBody {
                if let jsonData = try? JSONSerialization.data(withJSONObject: responseBody, options: .prettyPrinted),
                   let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                }
            }
            
            let errorResponse = ErrorResponse(
                status: false,
                message: errorMessage,
                data: errorData,
                status_code: statusCode
            )
            
            return .failure(errorResponse)
        }
        
        // Caso inesperado
        return .failure(ErrorResponse(
            status: false,
            message: "Respuesta inesperada del servidor",
            data: nil,
            status_code: statusCode
        ))
    }
    
    
    private func authenticate() -> String {
        let authResult = Auth(delegate.publicKey, delegate.privateKey).authenticate()
        
        switch authResult {
        case .success(let authToken):
            if let token = authToken.bearer_token {
                return token
            } else {
                return ""
            }
        case .failure(let error):
            print("Error al obtener token JWT: \(error.message)")
            return ""
        }
    }
}

