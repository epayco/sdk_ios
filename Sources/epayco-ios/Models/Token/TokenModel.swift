import Foundation

public struct TokenModel: Codable {
    public let status: Bool
    public let data: TokenDataModel
    public let message: String?
    public let id: String?
    public let success: Bool?
    public let card: TokenCardModel?
}

public struct TokenDataModel: Codable {
    public let status: String
    public let id: String?
    public let description: String?
    public let created: String?
    public let livemode: Bool?
    public let errors: String?
}

public struct TokenCardModel: Codable {
    public let exp_month: String
    public let exp_year: String
    public let name: String
    public let mask: String
}
