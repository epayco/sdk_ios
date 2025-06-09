import Foundation

public struct NewSubscriptionModel: Encodable {
    public let id_plan: String
    public let customer: String
    public let token_card: String
    public let doc_type: String
    public let doc_number: String
    public let url_confirmation: String?
    public let method_confirmation: String?
}
