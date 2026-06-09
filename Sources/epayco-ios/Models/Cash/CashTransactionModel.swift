import Foundation

public struct CashTransactionModel: Codable {
    public let success: Bool?
    public let title_response: String?
    public let text_response: String?
    public let last_action: String?
    public let data: CashTransactionDataModel
}

public struct CashTransactionDataModel: Codable {
    public let totalerrores: Int?
    public let errores: [PaymentErrorModel]?
    public let ref_payco: Int?
    public let factura: String?
    public let descripcion: String?
    public let valor: String?
    public let iva: String?
    public let moneda: String?
    public let banco: String?
    public let estado: String?
    public let respuesta: String?
    public let autorizacion: String?
    public let recibo: Int?
    public let fecha: String?
    public let franquicia: String?
    public let cod_respuesta: Int?
    public let ip: String?
    public let enpruebas: Int?
    public let tipo_doc: String?
    public let documento: String?
    public let nombres: String?
    public let apellidos: String?
    public let email: String?
    public let ciudad: String?
    public let direccion: String?
    public let ind_pais: String?
    public let fechapago: String?
    public let fechaexpiracion: String?
    public let factor_conversion: Decimal?
    public let valor_pesos: String?
}
