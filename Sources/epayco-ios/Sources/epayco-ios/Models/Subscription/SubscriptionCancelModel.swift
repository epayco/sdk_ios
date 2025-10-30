import Foundation

public struct SubscriptionCancelModel: Encodable {
    public let id: String
    
    public init(id: String) {
        self.id = id
    }
}
