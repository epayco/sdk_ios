import Foundation

public struct ChargedSubscriptionModel: Codable {
    public let success: Bool?
    public let title_response: String?
    public let text_response: String?
    public let last_action: String?
    public let message: String?
    public let periodStart: String?
    public let periodEnd: String?
    public let nextVerificationDate: String?
    public let first: String?
    public let idCustomer: String?
    public let tokenCard: String?
    public let ip: String?
    public let url_confirmation: String?
    public let method_confirmation: String?
    public let data: ChargedSubscriptionDataModel
    public let subscription: SubscriptionDataModel?
}

public struct ChargedSubscriptionDataModel: Codable {
    public let status: String?
    public let description: String?
    public let errors: String?
    public let ref_payco: Int?
    public let factura: String?
    public let descripcion: String?
    public let valor: String?
    public let iva: String?
    public let baseiva: Int?
    public let moneda: String?
    public let banco: String?
    public let estado: String?
    public let respuesta: String?
    public let autorizacion: String?
    public let recibo: String?
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
}
