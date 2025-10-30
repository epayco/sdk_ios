import Foundation

public struct NewSubscriptionModel: Encodable {
    public let id_plan: String
    public let customer: String
    public let token_card: String
    public let doc_type: String
    public let doc_number: String
    public let url_confirmation: String?
    public let method_confirmation: String?
    
    public init(id_plan: String, customer: String, token_card: String, doc_type: String, doc_number: String, url_confirmation: String? = nil, method_confirmation: String? = nil) {
        self.id_plan = id_plan
        self.customer = customer
        self.token_card = token_card
        self.doc_type = doc_type
        self.doc_number = doc_number
        self.url_confirmation = url_confirmation
        self.method_confirmation = method_confirmation
    }
}
