import Foundation

public struct CustomerGetModel: Codable {
    public let status: Bool
    public let success: Bool?
    public let message: String?
    public let type: String?
    public let data: CustomerGetDataModel
}

public struct CustomerGetDataModel: Codable {
    public let status: String?
    public let description: String?
    public let errors: String?
    public let id_customer: String?
    public let name: String?
    public let created: String?
    public let doc_type: String?
    public let doc_number: String?
    public let email: String?
    public let phone: String?
    public let address: String?
    public let cards: [CustomerCardModel]?
}

public struct CustomerCardModel: Codable {
    public let token: String
    public let franchise: String
    public let mask: String
    public let created: String
}
