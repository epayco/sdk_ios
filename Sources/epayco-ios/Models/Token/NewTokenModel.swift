import Foundation

public struct NewTokenModel: Encodable {
    public let card: CardTokenModel
    
    public init(card: CardTokenModel) {
        self.card = card
    }
}

public struct CardTokenModel: Encodable {
    public let number: String
    public let exp_year: String
    public let exp_month: String
    public let cvc: String
    
    public init(number: String, exp_year: String, exp_month: String, cvc: String) {
        self.number = number
        self.exp_year = exp_year
        self.exp_month = exp_month
        self.cvc = cvc
    }
}