import Foundation

public struct SubscriptionGetModel: Codable {
    public let status: Bool
    public let message: String?
    public let created: String?
    public let id: String?
    public let success: Bool?
    public let current_period_start: String?
    public let current_period_end: String?
    public let status_plan: String?
    public let type: String?
    public let customer: String?
    public let plan: SubscriptionGetPlanModel?
    public let data: SubscriptionGetDataModel?
}

public struct SubscriptionGetPlanModel: Codable {
    public let _id: String
    public let idClient: String
    public let name: String
    public let description: String
    public let amount: Decimal
    public let currency: String
    public let interval: String
    public let interval_count: Int
    public let status: String
    public let trialDays: Int
}

public struct SubscriptionGetDataModel: Codable {
    public let status: String
    public let description: String
    public let errors: String
}
