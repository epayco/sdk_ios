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
    
    public func performRequest<T: Encodable>(httpMethod: String, requestBody: T?, isAuthRequired: Bool = true) -> ResponseModel? {
        if let url = URL(string: self.url) {
            let semaphore = DispatchSemaphore(value: 0)
            let session = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            let requestType = self.url.contains(K.urlBase) ? "sdk-jwt" : "sdk"
            var response: ResponseModel? = nil
            var responseData: Data?
            var responseError: Error?
            
            request.httpMethod = httpMethod
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue(requestType, forHTTPHeaderField: "type")
            request.setValue("swift", forHTTPHeaderField: "lang")
            
            if isAuthRequired {
                let authToken = self.url.contains(K.urlBase) ? "Bearer " + authenticate() : "Basic " +  Data(delegate.publicKey.utf8).base64EncodedString()
                request.setValue(authToken, forHTTPHeaderField: "Authorization")
            }
            
            if httpMethod != "GET" {
                request.httpBody = try? JSONEncoder().encode(requestBody)
            }
            
            let task = session.dataTask(with: request) { (data, response, error) in
                responseData = data
                responseError = error
                semaphore.signal()
            }
            
            task.resume()
            semaphore.wait()
            
            if responseError != nil {
                response = self.handleError(error: responseError!) as? ResponseModel
            }
            
            if responseData != nil {
                print("📥 responseData recibido: \(String(data: responseData ?? Data(), encoding: .utf8) ?? "No se pudo convertir a String")")

                if let parsedData: ResponseModel? = self.parseJSON(responseData!) {
                    print("✅ Datos parseados correctamente: \(String(describing: parsedData))")

                    response = parsedData
                } else {
                    print("❌ Error al parsear JSON a ResponseModel")
                }
            }

            return response
        }
        
        return nil
    }
    
    private func authenticate() -> String {
        let authResponse = Auth(delegate.publicKey, delegate.privateKey).authenticate()
        
        if let authToken = authResponse!.bearer_token {
            return authToken
        }
        else {
            return ""
        }
    }
    
    private func handleError(error: Error) -> Any {
        return "nil"
    }
    
    private func parseJSON<T: Decodable>(_ data: Data) -> T? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData as T
        } catch {
            return nil
        }
    }
}
