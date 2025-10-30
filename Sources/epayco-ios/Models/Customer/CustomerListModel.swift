import Foundation

public struct CustomerListModel: Codable {
    public let status: Bool
    public let success: Bool
    public let type: String
    public let data: [CustomerListDataModel]
}

public struct CustomerListDataModel: Codable {
    public let id_customer: String
    public let email: String
    public let name: String
    public let doc_number: String
    public let created: String
}
