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
    
    public func authenticate() -> AuthTokenModel? {
        let url = K.urlBase + "/v1/auth/login"
        let networkManager = NetworkManager<AuthTokenModel>(url, delegate: self)
        let credentials = AuthCredentialsModel(public_key: self.publicKey, private_key: self.privateKey)
        let authToken = networkManager.performRequest(httpMethod: "POST", requestBody: credentials, isAuthRequired: false)

        return authToken
    }
}
