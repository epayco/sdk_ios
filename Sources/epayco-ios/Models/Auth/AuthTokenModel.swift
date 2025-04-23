import Foundation

public struct AuthTokenModel: Codable {
    public let status: Bool
    public let message: String
    public let bearer_token: String?
    public let data: [String]?
}
