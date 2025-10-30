import Foundation

public struct RemoveTokenModel: Encodable {
    public let franchise: String
    public let mask: String
    public let customer_id: String
    
    public init(franchise: String, mask: String, customer_id: String) {
        self.franchise = franchise
        self.mask = mask
        self.customer_id = customer_id
    }
}
