import Foundation

public struct AuthCredentialsModel: Encodable {
    public let public_key: String
    public let private_key: String
}
