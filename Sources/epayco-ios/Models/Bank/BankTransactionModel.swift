import Foundation

public struct BankTransactionModel: Codable {
    public let success: Bool?
    public let title_response: String?
    public let text_response: String?
    public let last_action: String?
    public let data: BankTransactionDataModel?
}

public struct BankTransactionDataModel: Codable {
    public let totalerrores: Int?
    public let errores: [PaymentErrorModel]?
    public let ref_payco: Int?
    public let factura: String?
    public let description: String?
    public let valor: String?
    public let iva: String?
    public let baseiva: String?
    public let moneda: String?
    public let estado: String?
    public let respuesta: String?
    public let autorizacion: String?
    public let recibo: String?
    public let fecha: String?
    public let urlbanco: String?
    public let transactionId: String?
    public let ticketId: String?
}
