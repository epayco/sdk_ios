//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct Plan: NetworkManagerDelegate {
    var publicKey: String
    var privateKey: String
    
    init(_ publicKey: String, _ privateKey: String){
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    public func create(newPlanData: NewPlanModel) -> PlanModel? {
        let url = K.urlBase + "/recurring/v1/plan/create"
        let networkManager = NetworkManager<PlanModel>(url, delegate: self)
        let newPlan = networkManager.performRequest(httpMethod: "POST", requestBody: newPlanData)
        
        return newPlan
    }
    
    public func get(planId: String) -> PlanGetModel? {
        let url = K.urlBase + "/recurring/v1/plan/" + self.publicKey + "/" + planId
        let networkManager = NetworkManager<PlanGetModel>(url, delegate: self)
        let foundPlan = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundPlan
    }
    
    public func getList() -> PlanListModel? {
        let url = K.urlBase + "/recurring/v1/plans/" + self.publicKey
        let networkManager = NetworkManager<PlanListModel>(url, delegate: self)
        let foundPlans = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundPlans
    }
    
    public func remove(planId: String) -> RemovePlanModel? {
        let url = K.urlBase + "/recurring/v1/plan/remove/" + self.publicKey + "/" + planId
        let networkManager = NetworkManager<RemovePlanModel>(url, delegate: self)
        let foundPlans = networkManager.performRequest(httpMethod: "POST", requestBody: "")
        
        return foundPlans
    }
}
