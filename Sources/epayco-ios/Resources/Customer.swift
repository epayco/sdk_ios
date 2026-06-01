import Foundation

public struct Customer: NetworkManagerDelegate {
    public var publicKey: String
    public var privateKey: String

    public init(_ publicKey: String, _ privateKey: String){
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    public func create(newCustomerData: NewCustomerModel) -> Result<CustomerModel, ErrorResponse> {
        let url = K.urlBase + "/payment/v1/customer/create"
        let networkManager = NetworkManager<CustomerModel>(url, delegate: self)
        let newCustomer = networkManager.performRequest(httpMethod: "POST", requestBody: newCustomerData)
        
        return newCustomer
    }
    
    public func get(customerId: String) -> Result<CustomerGetModel, ErrorResponse> {
        let url = K.urlBase + "/payment/v1/customer/" + self.publicKey + "/" + customerId
        let networkManager = NetworkManager<CustomerGetModel>(url, delegate: self)
        let foundCustomer = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundCustomer
    }
    
    public func getList() -> Result<CustomerListModel, ErrorResponse> {
        let url = K.urlBase + "/payment/v1/customers/" + self.publicKey
        let networkManager = NetworkManager<CustomerListModel>(url, delegate: self)
        let foundCustomers = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundCustomers
    }
    
    public func update(customerId: String, newName: String) -> Result<UpdatedCustomerModel, ErrorResponse> {
        let url = K.urlBase + "/payment/v1/customer/edit/" + self.publicKey + "/" + customerId
        let networkManager = NetworkManager<UpdatedCustomerModel>(url, delegate: self)
        let updatedCustomer = networkManager.performRequest(httpMethod: "POST", requestBody: UpdateCustomerModel(name: newName))
        
        return updatedCustomer
    }
}
