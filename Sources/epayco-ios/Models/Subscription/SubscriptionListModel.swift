import Foundation

public struct SubscriptionListModel: Codable {
    public let status: Bool?
    public let success: Bool?
    public let type: String?
    public let message: String?
    public let data: [SubscriptionListDataModel]?
}

public struct SubscriptionListDataModel: Codable {
    public let _id: String?
    public let idPlan: String?
    public let periodStart: String?
    public let periodEnd: String?
    public let nextVerificationDate: String?
    public let status: String?
    public let first: Bool?
    public let idCustomer: String?
    public let paymentAttempts: String?
    public let tokenCard: String?
    public let description: String?
    public let errors: String?
    public let plan: PlanGetDataModel?
}
