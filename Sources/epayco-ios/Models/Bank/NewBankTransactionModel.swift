import Foundation

public struct NewBankTransactionModel: Encodable {
    public let bank: String
    public let invoice: String
    public let description: String
    public let value: String
    public let tax: String
    public let taxBase: String
    public let currency: String
    public let personType: String
    public let docType: String
    public let docNumber: String
    public let name: String
    public let lastName: String
    public let email: String
    public let country: String
    public let cellPhone: String
    public let responseUrl: String
    public let confirmationUrl: String
    public let confirmationMethod: String
    public let ip: String
    public let extra1: String
    public let extra2: String
    public let extra3: String
    public let extra4: String
    public let extra5: String
    public let extra6: String
    public let extra7: String
    public let extras_epayco: ExtrasModel? 
    
    public init(bank: String, invoice: String, description: String, value: String, tax: String, taxBase: String, currency: String, personType: String, docType: String, docNumber: String, name: String, lastName: String, email: String, country: String, cellPhone: String, responseUrl: String, confirmationUrl: String, confirmationMethod: String, ip: String, extra1: String, extra2: String, extra3: String, extra4: String, extra5: String, extra6: String, extra7: String, extras_epayco: ExtrasModel? = nil) {
        self.bank = bank
        self.invoice = invoice
        self.description = description
        self.value = value
        self.tax = tax
        self.taxBase = taxBase
        self.currency = currency
        self.personType = personType
        self.docType = docType
        self.docNumber = docNumber
        self.name = name
        self.lastName = lastName
        self.email = email
        self.country = country
        self.cellPhone = cellPhone
        self.responseUrl = responseUrl
        self.confirmationUrl = confirmationUrl
        self.confirmationMethod = confirmationMethod
        self.ip = ip
        self.extra1 = extra1
        self.extra2 = extra2
        self.extra3 = extra3
        self.extra4 = extra4
        self.extra5 = extra5
        self.extra6 = extra6
        self.extra7 = extra7
        self.extras_epayco = extras_epayco
    }
}
