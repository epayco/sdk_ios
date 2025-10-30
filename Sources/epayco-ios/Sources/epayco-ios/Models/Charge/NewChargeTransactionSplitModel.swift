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
    
    public init(token_card: String, customer_id: String, doc_type: String, doc_number: String, name: String, last_name: String, email: String, bill: String, description: String, value: String, tax: String, tax_base: String, currency: String, dues: String, address: String, phone: String, cell_phone: String, url_response: String, url_confirmation: String, ip: String, splitpayment: String, split_app_id: String, split_merchant_id: String, split_type: String, split_rule: String, split_primary_receiver: String, split_primary_receiver_fee: String, split_receivers: [SplitReceiverModel], extras: ExtrasModel? = nil, extras_epayco: ExtrasModel? = nil) {
        self.token_card = token_card
        self.customer_id = customer_id
        self.doc_type = doc_type
        self.doc_number = doc_number
        self.name = name
        self.last_name = last_name
        self.email = email
        self.bill = bill
        self.description = description
        self.value = value
        self.tax = tax
        self.tax_base = tax_base
        self.currency = currency
        self.dues = dues
        self.address = address
        self.phone = phone
        self.cell_phone = cell_phone
        self.url_response = url_response
        self.url_confirmation = url_confirmation
        self.ip = ip
        self.splitpayment = splitpayment
        self.split_app_id = split_app_id
        self.split_merchant_id = split_merchant_id
        self.split_type = split_type
        self.split_rule = split_rule
        self.split_primary_receiver = split_primary_receiver
        self.split_primary_receiver_fee = split_primary_receiver_fee
        self.split_receivers = split_receivers
        self.extras = extras
        self.extras_epayco = extras_epayco
    }
}
