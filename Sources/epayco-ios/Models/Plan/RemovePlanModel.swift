import Foundation

public struct RemovePlanModel: Codable {
    public let status: Bool
    public let message: String
    public let success: Bool
    public let type: String
    public let data: RemovePlanDataModel
}

public struct RemovePlanDataModel: Codable {
    public let idPlan: String
}
