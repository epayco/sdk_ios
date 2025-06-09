import Foundation

public struct NewChargeSplitTransactionModel: Encodable {
    public let token_card: String
    public let customer_id: String
    public let doc_type: String
    public let doc_number: String
    public let name: String
    public let last_name: String
    public let email: String
    public let bill: String
    public let description: String
    public let value: String
    public let tax: String
    public let tax_base: String
    public let currency: String
    public let dues: String
    public let address: String
    public let phone: String
    public let cell_phone: String
    public let url_response: String
    public let url_confirmation: String
    public let ip: String
    public let splitpayment: String
    public let split_app_id: String
    public let split_merchant_id: String
    public let split_type: String
    public let split_rule: String
    public let split_primary_receiver: String
    public let split_primary_receiver_fee: String
    public let split_receivers: [SplitReceiverModel]
    public let extras: ExtrasModel?
    public let extras_epayco: ExtrasModel?
}
