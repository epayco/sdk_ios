//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct Subscription: NetworkManagerDelegate {
    var publicKey: String
    var privateKey: String
    
    init(_ publicKey: String, _ privateKey: String){
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    public func create(newSubscriptionData: NewSubscriptionModel) -> SubscriptionModel? {
        let url = K.urlBase + "/recurring/v1/subscription/create"
        let networkManager = NetworkManager<SubscriptionModel>(url, delegate: self)
        let newSubscription = networkManager.performRequest(httpMethod: "POST", requestBody: newSubscriptionData)
        
        return newSubscription
    }
    
    public func get(subscriptionId: String) -> SubscriptionGetModel? {
        let url = K.urlBase + "/recurring/v1/subscription/" + subscriptionId + "/" + self.publicKey
        let networkManager = NetworkManager<SubscriptionGetModel>(url, delegate: self)
        let foundSubscription = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundSubscription
    }

    public func getList() -> SubscriptionModel? {
        let url = K.urlBase + "/recurring/v1/subscriptions/" + self.publicKey
        let networkManager = NetworkManager<SubscriptionModel>(url, delegate: self)
        let foundSubscriptions = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundSubscriptions
    }

    public func cancel(subscriptionId: String) -> CancelledSubscriptionModel? {
        let url = K.urlBase + "/recurring/v1/subscription/cancel"
        let networkManager = NetworkManager<CancelledSubscriptionModel>(url, delegate: self)
        let subscriptionCancellation = networkManager.performRequest(httpMethod: "POST", requestBody: SubscriptionCancelModel(id: subscriptionId))
        
        return subscriptionCancellation
    }

    public func charge(subscriptionChargeData: SubscriptionChargeModel) -> ChargedSubscriptionModel? {
        let url = K.urlBase + "/payment/v1/charge/subscription/create"
        let networkManager = NetworkManager<ChargedSubscriptionModel>(url, delegate: self)
        let subscriptionCharge = networkManager.performRequest(httpMethod: "POST", requestBody: subscriptionChargeData)
        
        return subscriptionCharge
    }
}
