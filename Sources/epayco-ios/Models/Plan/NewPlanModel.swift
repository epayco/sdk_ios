import Foundation

public struct NewPlanModel: Encodable {
    public let id_plan: String
    public let name: String
    public let description: String
    public let amount: Decimal
    public let currency: String
    public let interval: String
    public let interval_count: Int
    public let trial_days: Int
}
