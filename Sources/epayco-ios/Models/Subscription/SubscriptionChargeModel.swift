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
    
    public init(id_plan: String, customer: String, token_card: String, doc_type: String, doc_number: String, ip: String, address: String, phone: String, cell_phone: String) {
        self.id_plan = id_plan
        self.customer = customer
        self.token_card = token_card
        self.doc_type = doc_type
        self.doc_number = doc_number
        self.ip = ip
        self.address = address
        self.phone = phone
        self.cell_phone = cell_phone
    }
}
