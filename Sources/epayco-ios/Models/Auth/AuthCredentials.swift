import Foundation

public struct AuthCredentialsModel: Encodable {
    public let public_key: String
    public let private_key: String
    
    public init(public_key: String, private_key: String) {
        self.public_key = public_key
        self.private_key = private_key
    }
}
