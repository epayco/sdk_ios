import Foundation

public struct NewTokenModel: Encodable {
    public let number: String
    public let exp_year: String
    public let exp_month: String
    public let cvc: String
    
    public init(card: CardTokenModel) {
        self.number = card.number
        self.exp_year = card.exp_year
        self.exp_month = card.exp_month
        self.cvc = card.cvc
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