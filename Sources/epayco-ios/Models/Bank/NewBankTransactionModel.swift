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
}
