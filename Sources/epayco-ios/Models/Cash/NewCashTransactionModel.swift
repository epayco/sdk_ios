import Foundation

public struct NewCashTransactionModel: Encodable {
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
    public let cellPhone: String
    public let country: String
    public let city: String
    public let endDate: String
    public let ip: String
    public let responseUrl: String
    public let confirmationUrl: String
    public let confirmationMethod: String
    public let extras_epayco: ExtrasModel?
    
    public init(invoice: String, description: String, value: String, tax: String, taxBase: String, currency: String, personType: String, docType: String, docNumber: String, name: String, lastName: String, email: String, cellPhone: String, country: String, city: String, endDate: String, ip: String, responseUrl: String, confirmationUrl: String, confirmationMethod: String, extras_epayco: ExtrasModel? = nil) {
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
        self.cellPhone = cellPhone
        self.country = country
        self.city = city
        self.endDate = endDate
        self.ip = ip
        self.responseUrl = responseUrl
        self.confirmationUrl = confirmationUrl
        self.confirmationMethod = confirmationMethod
        self.extras_epayco = extras_epayco
    }
}
