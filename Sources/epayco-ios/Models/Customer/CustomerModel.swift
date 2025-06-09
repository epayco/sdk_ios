import Foundation

public struct CustomerModel: Codable {
    public let status: Bool
    public let message: String?
    public let success: Bool?
    public let type: String?
    public let data: CustomerDataModel
}

public struct CustomerDataModel: Codable {
    public let status: String
    public let description: String
    public let customerId: String?
    public let email: String?
    public let name: String?
    public let errors: String?
}
