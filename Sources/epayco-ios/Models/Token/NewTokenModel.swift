import Foundation

public struct NewTokenModel: Encodable {
    public let card: CardTokenModel
}

public struct CardTokenModel: Encodable {
    public let number: String
    public let exp_year: String
    public let exp_month: String
    public let cvc: String
}