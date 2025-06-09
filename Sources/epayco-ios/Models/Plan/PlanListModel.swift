import Foundation

public struct PlanListModel: Codable {
    public let status: Bool
    public let success: Bool
    public let type: String
    public let data: [PlanListDataModel]
}

public struct PlanListDataModel: Codable {
    public let _id: String
    public let id_plan: String
    public let name: String
    public let description: String
    public let amount: Decimal
    public let currency: String
    public let interval_count: Int
    public let interval: String
    public let status: String
    public let trial_days: Int
    public let created: String
}
