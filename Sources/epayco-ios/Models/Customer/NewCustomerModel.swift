import Foundation

public struct NewCustomerModel: Encodable {
    public let token_card: String
    public let name: String
    public let last_name: String
    public let email: String
    public let isDefault: Bool
    public let city: String
    public let address: String
    public let phone: String
    public let cell_phone: String
    
    public init(token_card: String, name: String, last_name: String, email: String, isDefault: Bool, city: String, address: String, phone: String, cell_phone: String) {
        self.token_card = token_card
        self.name = name
        self.last_name = last_name
        self.email = email
        self.isDefault = isDefault
        self.city = city
        self.address = address
        self.phone = phone
        self.cell_phone = cell_phone
    }
}
