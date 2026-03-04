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
    
    public init(id_plan: String, name: String, description: String, amount: Decimal, currency: String, interval: String, interval_count: Int, trial_days: Int) {
        self.id_plan = id_plan
        self.name = name
        self.description = description
        self.amount = amount
        self.currency = currency
        self.interval = interval
        self.interval_count = interval_count
        self.trial_days = trial_days
    }
}
