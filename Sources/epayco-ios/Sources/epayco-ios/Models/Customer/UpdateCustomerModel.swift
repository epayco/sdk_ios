import Foundation

public struct UpdateCustomerModel: Encodable {
   public let name: String
   
   public init(name: String) {
       self.name = name
   }
}
