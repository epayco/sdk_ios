public class Epayco {
    public let publicKey: String
    public let privateKey: String
    public let lang: String
    public let test: Bool
    public let bank: Bank
    public let cash: Cash
    public let charge: Charge
    public let customer: Customer
    public let plan: Plan
    public let subscription: Subscription
    public let token: Token
    
    public init(publicKey: String, privateKey: String, lang: String, test: Bool = false){
        self.publicKey = publicKey
        self.privateKey = privateKey
        self.lang = lang
        self.test = test
        self.bank = Bank(publicKey, privateKey, test, iv: "0000000000000000")
        self.cash = Cash(publicKey, privateKey, test)
        self.charge = Charge(publicKey, privateKey)
        self.customer = Customer(publicKey, privateKey)
        self.plan = Plan(publicKey, privateKey)
        self.subscription = Subscription(publicKey, privateKey)
        self.token = Token(publicKey, privateKey)
    }
}
