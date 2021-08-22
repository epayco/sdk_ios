class Epayco {
    let publicKey: String
    let privateKey: String
    let lang: String
    let test: Bool
    let bank: Bank
    let cash: Cash
    let charge: Charge
    let customer: Customer
    let plan: Plan
    let subscription: Subscription
    let token: Token
    
    init(publicKey: String, privateKey: String, lang: String, test: Bool = false){
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

