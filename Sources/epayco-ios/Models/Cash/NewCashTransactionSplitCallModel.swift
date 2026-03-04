import Foundation

public struct NewCashTransactionSplitCallModel: Encodable {
    public let factura: String
    public let descripcion: String
    public let valor: String
    public let iva: String
    public let baseiva: String
    public let moneda: String
    public let tipo_persona: String
    public let tipo_doc: String
    public let documento: String
    public let nombres: String
    public let apellidos: String
    public let email: String
    public let celular: String
    public let fechaexpiracion: String
    public let url_respuesta: String
    public let url_confirmacion: String
    public let metodoconfirmacion: String
    public let public_key: String
    public let enpruebas: Bool
    public let ip: String
    public let lenguaje: String
    public let splitpayment: String
    public let split_app_id: String
    public let split_merchant_id: String
    public let split_type: String
    public let split_rule: String
    public let split_primary_receiver: String
    public let split_primary_receiver_fee: String
    public let split_receivers: [SplitReceiverModel]
    public let extras_epayco: ExtrasModel?
}
