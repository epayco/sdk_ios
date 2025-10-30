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
    public let extras_epayco: [ExtrasModel]?

    enum CodingKeys: String, CodingKey {
        case banco = "bankCode"
        case factura = "idfactura"
        case descripcion = "description"
        case valor = "amount"
        case iva = "tax"
        case baseiva = "taxBase"
        case moneda = "currency"
        case tipo_persona = "typePerson"
        case tipo_doc = "documentType"
        case documento = "document"
        case nombres = "names"
        case apellidos = "lastNames"
        case email = "email"
        case pais = "country"
        case celular = "cellPhone"
        case url_respuesta = "urlResponse"
        case url_confirmacion = "urlConfirmation"
        case metodoconfirmacion = "confirmationMethod"
        case extra1 = "extra1"
        case extra2 = "extra2"
        case extra3 = "extra3"
        case extra4 = "extra4"
        case extra5 = "extra5"
        case extra6 = "extra6"
        case extra7 = "extra7"
        case public_key = "publicKey"
        case enpruebas = "test"
        case ip = "ip"
        case lenguaje = "language"
        case i = "i"
        case extras_epayco = "extras_epayco"
    }

    public init(banco: String?, factura: String?, descripcion: String?, valor: String?, iva: String?, baseiva: String?, moneda: String?, tipo_persona: String?, tipo_doc: String?, documento: String?, nombres: String?, apellidos: String?, email: String?, pais: String?, celular: String?, url_respuesta: String?, url_confirmacion: String?, metodoconfirmacion: String?, extra1: String?, extra2: String?, extra3: String?, extra4: String?, extra5: String?, extra6: String?, extra7: String?, public_key: String?, enpruebas: String?, ip: String?, lenguaje: String?, i: String?, extras_epayco: ExtrasModel? = nil) {
        self.banco = banco
        self.factura = factura
        self.descripcion = descripcion
        self.valor = valor
        self.iva = iva
        self.baseiva = baseiva
        self.moneda = moneda
        self.tipo_persona = tipo_persona
        self.tipo_doc = tipo_doc
        self.documento = documento
        self.nombres = nombres
        self.apellidos = apellidos
        self.email = email
        self.pais = pais
        self.celular = celular
        self.url_respuesta = url_respuesta
        self.url_confirmacion = url_confirmacion
        self.metodoconfirmacion = metodoconfirmacion
        self.extra1 = extra1
        self.extra2 = extra2
        self.extra3 = extra3
        self.extra4 = extra4
        self.extra5 = extra5
        self.extra6 = extra6
        self.extra7 = extra7
        self.public_key = public_key
        self.enpruebas = enpruebas
        self.ip = ip
        self.lenguaje = lenguaje
        self.i = i
        self.extras_epayco = extras_epayco
    }
}
