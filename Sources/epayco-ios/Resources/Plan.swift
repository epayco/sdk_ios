import Foundation

public struct Plan: NetworkManagerDelegate {
    public var publicKey: String
    public var privateKey: String
    
    public init(_ publicKey: String, _ privateKey: String){
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    public func create(newPlanData: NewPlanModel) -> Result<PlanModel, ErrorResponse> {
        let url = K.urlBase + "/recurring/v1/plan/create"
        let networkManager = NetworkManager<PlanModel>(url, delegate: self)
        let newPlan = networkManager.performRequest(httpMethod: "POST", requestBody: newPlanData)
        
        return newPlan
    }
    
    public func get(planId: String) -> Result<PlanGetModel, ErrorResponse> {
        let url = K.urlBase + "/recurring/v1/plan/" + self.publicKey + "/" + planId
        let networkManager = NetworkManager<PlanGetModel>(url, delegate: self)
        let foundPlan = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundPlan
    }
    
    public func getList() -> Result<PlanListModel, ErrorResponse> {
        let url = K.urlBase + "/recurring/v1/plans/" + self.publicKey
        let networkManager = NetworkManager<PlanListModel>(url, delegate: self)
        let foundPlans = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundPlans
    }
    
    public func remove(planId: String) -> Result<RemovePlanModel, ErrorResponse> {
        let url = K.urlBase + "/recurring/v1/plan/remove/" + self.publicKey + "/" + planId
        let networkManager = NetworkManager<RemovePlanModel>(url, delegate: self)
        let foundPlans = networkManager.performRequest(httpMethod: "POST", requestBody: "")
        
        return foundPlans
    }
}
