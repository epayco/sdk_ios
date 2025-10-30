import Foundation

public struct CancelledSubscriptionModel: Codable {
    public let status: Bool
    public let message: String
    public let success: Bool?
    public let type: String?
    public let data: CancelledSubscriptionDataModel
}

public struct CancelledSubscriptionDataModel: Codable {
    public let status: String?
    public let description: String
}
