import Foundation

public struct SubscriptionModel: Codable {
    public let status: Bool
    public let message: String
    public let created: String?
    public let id: String?
    public let success: Bool?
    public let current_period_start: String?
    public let current_period_end: String?
    public let status_subscription: String?
    public let type: String?
    public let customer: SubscriptionCustomerModel?
    public let data: SubscriptionDataModel
}

public struct SubscriptionDataModel: Codable {
    public let status: String?
    public let description: String?
    public let errores: String?
    public let idClient: String?
    public let name: String?
    public let amount: Decimal?
    public let currency: String?
    public let interval: String?
    public let interval_count: Int?
    public let trial_days: Int?
    public let createdAt: String?
}

public struct SubscriptionCustomerModel: Codable {
    public let _id: String
    public let name: String
    public let email: String
    public let doc_number: String
    public let merchantId: String
    public let indicative: String?
    public let country: String?
    public let city: String
    public let address: String
    public let break_card: Bool
    public let doc_type: String
    public let updated_at: String
}
