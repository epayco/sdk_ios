//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/7/21.
//

import Foundation

struct Token: NetworkManagerDelegate {
    var publicKey: String
    var privateKey: String
    
    init(_ publicKey: String, _ privateKey: String){
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    public func create(newTokenData: NewTokenModel) -> TokenModel? {
        let url = K.urlBase + "/v1/tokens"
        let networkManager = NetworkManager<TokenModel>(url, delegate: self)
        let newToken = networkManager.performRequest(httpMethod: "POST", requestBody: newTokenData)
        
        return newToken;
    }
    
    public func remove(customerId: String, franchise: String, mask: String) -> RemovedTokenModel? {
        let url = K.urlBase + "/v1/remove/token"
        let networkManager = NetworkManager<RemovedTokenModel>(url, delegate: self)
        let removeTokenData = RemoveTokenModel(franchise: franchise, mask: mask, customer_id: customerId)
        let removeTokenResult = networkManager.performRequest(httpMethod: "POST", requestBody: removeTokenData)
        
        return removeTokenResult
    }
}
