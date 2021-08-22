//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct Customer: NetworkManagerDelegate {
    var publicKey: String
    var privateKey: String

    init(_ publicKey: String, _ privateKey: String){
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    public func create(newCustomerData: NewCustomerModel) -> CustomerModel? {
        let url = K.urlBase + "/payment/v1/customer/create"
        let networkManager = NetworkManager<CustomerModel>(url, delegate: self)
        let newCustomer = networkManager.performRequest(httpMethod: "POST", requestBody: newCustomerData)
        
        return newCustomer
    }
    
    public func get(customerId: String) -> CustomerGetModel? {
        let url = K.urlBase + "/payment/v1/customer/" + self.publicKey + "/" + customerId
        let networkManager = NetworkManager<CustomerGetModel>(url, delegate: self)
        let foundCustomer = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundCustomer
    }
    
    public func getList() -> CustomerListModel? {
        let url = K.urlBase + "/payment/v1/customers/" + self.publicKey
        let networkManager = NetworkManager<CustomerListModel>(url, delegate: self)
        let foundCustomers = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundCustomers
    }
    
    public func update(customerId: String, newName: String) -> UpdatedCustomerModel? {
        let url = K.urlBase + "/payment/v1/customer/edit/" + self.publicKey + "/" + customerId
        let networkManager = NetworkManager<UpdatedCustomerModel>(url, delegate: self)
        let updatedCustomer = networkManager.performRequest(httpMethod: "POST", requestBody: UpdateCustomerModel(name: newName))
        
        return updatedCustomer
    }
}
