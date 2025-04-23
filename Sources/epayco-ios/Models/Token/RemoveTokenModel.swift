import Foundation

public struct RemoveTokenModel: Encodable {
    public let franchise: String
    public let mask: String
    public let customer_id: String
}
