import Foundation

public struct SubscriptionChargeModel: Encodable {
    public let id_plan: String
    public let customer: String
    public let token_card: String
    public let doc_type: String
    public let doc_number: String
    public let ip: String
    public let address: String
    public let phone: String
    public let cell_phone: String
}
