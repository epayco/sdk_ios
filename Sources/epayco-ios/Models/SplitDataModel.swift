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
    
    public init(ip: String, splitpayment: String, split_app_id: String, split_merchant_id: String, split_type: String, split_rule: String, split_primary_receiver: String, split_primary_receiver_fee: String, split_receivers: [SplitReceiverModel]) {
        self.ip = ip
        self.splitpayment = splitpayment
        self.split_app_id = split_app_id
        self.split_merchant_id = split_merchant_id
        self.split_type = split_type
        self.split_rule = split_rule
        self.split_primary_receiver = split_primary_receiver
        self.split_primary_receiver_fee = split_primary_receiver_fee
        self.split_receivers = split_receivers
    }
}

public struct SplitReceiverModel: Encodable {
    public let id: String
    public let fee: String
    public let fee_type: String
    public let total: String
    
    public init(id: String, fee: String, fee_type: String, total: String) {
        self.id = id
        self.fee = fee
        self.fee_type = fee_type
        self.total = total
    }
}
