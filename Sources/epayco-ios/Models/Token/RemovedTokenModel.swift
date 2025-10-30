import Foundation

public struct RemovedTokenModel: Codable {
    public let status: Bool
    public let message: String
    public let success: Bool?
    public let type: String?
    public let data: RemovedTokenDataModel
}

public struct RemovedTokenDataModel: Codable {
    public let status: String?
    public let description: String?
    public let errors: String?
}
