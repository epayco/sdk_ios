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
}
