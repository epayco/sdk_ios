import Foundation

public struct PlanModel: Codable {
    public let status: Bool
    public let success: Bool?
    public let message: String?
    public let type: String?
    public let data: PlanDataModel
}

public struct PlanDataModel: Codable {
    public let status: String?
    public let id_plan: String?
    public let name: String?
    public let description: String
    public let amount: Decimal?
    public let currency: String?
    public let interval: String?
    public let interval_count: Int?
    public let trial_days: Int?
    public let test: Bool?
    public let afterPayment: Int?
    public let errors: String?
}
