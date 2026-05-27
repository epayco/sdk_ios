//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/14/21.
//

import Foundation

public struct Auth: NetworkManagerDelegate {
    public var publicKey: String
    public var privateKey: String
    
    public init(_ publicKey: String, _ privateKey: String){
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    public func authenticate() -> Result<AuthTokenModel, ErrorResponse> {
        let url = K.urlBase + "/v1/auth/login"
        
        print("🔍 Autenticando en: \(url)")
        print("📦 Credentials: public_key=\(self.publicKey.prefix(10))..., private_key=\(self.privateKey.prefix(10))...")
        
        let networkManager = NetworkManager<AuthTokenModel>(url, delegate: self)
        let credentials = AuthCredentialsModel(public_key: self.publicKey, private_key: self.privateKey)
        let authToken = networkManager.performRequest(httpMethod: "POST", requestBody: credentials, isAuthRequired: false)
        
        // Debug qué token se obtuvo
        if case .success(let model) = authToken {
            let tokenUsed = model.bearer_token ?? model.token ?? "No hay token"
            print("✅ Token obtenido: \(tokenUsed.prefix(20))...")
        } else if case .failure(let error) = authToken {
            print("❌ Error: \(error.message)")
        }

        return authToken
    }
}
