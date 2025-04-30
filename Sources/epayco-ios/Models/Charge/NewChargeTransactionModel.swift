import Foundation

public struct NewChargeTransactionModel: Encodable {
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
    public let extras: ExtrasModel?
}
