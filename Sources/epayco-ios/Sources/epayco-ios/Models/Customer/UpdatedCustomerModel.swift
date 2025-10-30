import Foundation

public struct UpdatedCustomerModel: Codable {
    public let status: Bool
    public let message: String?
    public let success: Bool?
    public let type: String?
    public let data: UpdatedCustomerDataModel
}

public struct UpdatedCustomerDataModel: Codable {
    public let status: String
    public let description: String
    public let customerId: String?
    public let name: String?
    public let email: String?
}
