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
    public let endDate: String
    public let ip: String
    public let responseUrl: String
    public let confirmationUrl: String
    public let confirmationMethod: String
    public let extras_epayco: ExtrasModel?
}
