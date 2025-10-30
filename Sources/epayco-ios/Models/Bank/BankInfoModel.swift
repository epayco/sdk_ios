import Foundation

public struct BankInfoModel: Codable {
    public let success: Bool
    public let title_response: String
    public let text_response: String
    public let last_action: String
    public let data: [BankInfoDataModel]
}

public struct BankInfoDataModel: Codable {
    public let bankCode: String
    public let bankName: String
}
