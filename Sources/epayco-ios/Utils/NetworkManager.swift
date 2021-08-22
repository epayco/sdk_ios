//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/12/21.
//

import Foundation


protocol NetworkManagerDelegate {
    var publicKey: String {get set}
    var privateKey: String {get set}
}

struct NetworkManager<ResponseModel: Decodable> {
    let url: String
    let delegate: NetworkManagerDelegate
    
    init(_ url: String, delegate: NetworkManagerDelegate){
        self.url = url
        self.delegate = delegate
    }
    
    func performRequest<T: Encodable>(httpMethod: String, requestBody: T?, isAuthRequired: Bool = true) -> ResponseModel? {
        if let url = URL(string: self.url) {
            let semaphore = DispatchSemaphore(value: 0);
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
                if let parsedData: ResponseModel? = self.parseJSON(responseData!) {
                    response = parsedData
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
