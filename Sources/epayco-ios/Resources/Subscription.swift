import Foundation

public struct Subscription: NetworkManagerDelegate {
    public var publicKey: String
    public var privateKey: String
    
    public init(_ publicKey: String, _ privateKey: String){
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    public func create(newSubscriptionData: NewSubscriptionModel) -> Result<SubscriptionModel, ErrorResponse> {
        let url = K.urlBase + "/recurring/v1/subscription/create"
        let networkManager = NetworkManager<SubscriptionModel>(url, delegate: self)
        let newSubscription = networkManager.performRequest(httpMethod: "POST", requestBody: newSubscriptionData)
        
        return newSubscription
    }
    
    public func get(subscriptionId: String) -> Result<SubscriptionGetModel, ErrorResponse> {
        let url = K.urlBase + "/recurring/v1/subscription/" + subscriptionId + "/" + self.publicKey
        let networkManager = NetworkManager<SubscriptionGetModel>(url, delegate: self)
        let foundSubscription = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundSubscription
    }

    public func getList() -> Result<SubscriptionListModel, ErrorResponse> {
        let url = K.urlBase + "/recurring/v1/subscriptions/" + self.publicKey
        let networkManager = NetworkManager<SubscriptionModel>(url, delegate: self)
        let foundSubscriptions = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundSubscriptions
    }

    public func cancel(subscriptionId: String) -> Result<CancelledSubscriptionModel, ErrorResponse> {
        let url = K.urlBase + "/recurring/v1/subscription/cancel"
        let networkManager = NetworkManager<CancelledSubscriptionModel>(url, delegate: self)
        let subscriptionCancellation = networkManager.performRequest(httpMethod: "POST", requestBody: SubscriptionCancelModel(id: subscriptionId))
        
        return subscriptionCancellation
    }

    public func charge(subscriptionChargeData: SubscriptionChargeModel) -> Result<ChargedSubscriptionModel, ErrorResponse> {
        let url = K.urlBase + "/payment/v1/charge/subscription/create"
        let networkManager = NetworkManager<ChargedSubscriptionModel>(url, delegate: self)
        let subscriptionCharge = networkManager.performRequest(httpMethod: "POST", requestBody: subscriptionChargeData)
        
        return subscriptionCharge
    }
}
