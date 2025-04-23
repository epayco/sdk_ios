import Foundation

public struct NewBankTransactionCallModel: Encodable {
    public let banco: String?
    public let factura: String?
    public let descripcion: String?
    public let valor: String?
    public let iva: String?
    public let baseiva: String?
    public let moneda: String?
    public let tipo_persona: String?
    public let tipo_doc: String?
    public let documento: String?
    public let nombres: String?
    public let apellidos: String?
    public let email: String?
    public let pais: String?
    public let celular: String?
    public let url_respuesta: String?
    public let url_confirmacion: String?
    public let metodoconfirmacion: String?
    public let extra1: String?
    public let extra2: String?
    public let extra3: String?
    public let extra4: String?
    public let extra5: String?
    public let extra6: String?
    public let extra7: String?
    public let public_key: String?
    public let enpruebas: String?
    public let ip: String?
    public let lenguaje: String?
    public let i: String?
}
