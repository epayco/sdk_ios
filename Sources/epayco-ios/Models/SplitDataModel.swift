import Foundation

public struct SplitDataModel: Encodable {
    public let ip: String
    public let splitpayment: String
    public let split_app_id: String
    public let split_merchant_id: String
    public let split_type: String
    public let split_rule: String
    public let split_primary_receiver: String
    public let split_primary_receiver_fee: String
    public let split_receivers: [SplitReceiverModel]
}

public struct SplitReceiverModel: Encodable {
    public let id: String
    public let fee: String
    public let fee_type: String
    public let total: String
}
