//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct ChargeTransactionModel: Codable {
    let status: Bool
    let type: String?
    let success: Bool?
    let data: ChargeTransactionDataModel
}

struct ChargeTransactionDataModel: Codable {
    let totalerrores: Int?
    let errores: [PaymentErrorModel]?
    let ref_payco: Int?
    let factura: String?
    let descripcion: String?
    let valor: String?
    let iva: String?
    let moneda: String?
    let banco: String?
    let estado: String?
    let respuesta: String?
    let autorizacion: String?
    let recibo: String?
    let fecha: String?
    let franquicia: String?
    let cod_respuesta: Int?
    let ip: String?
    let enpruebas: Int?
    let tipo_doc: String?
    let documento: String?
    let nombres: String?
    let apellidos: String?
    let email: String?
    let ciudad: String?
    let direccion: String?
    let ind_pais: String?
    let fechapago: String?
    let fechaexpiracion: String?
    let factor_conversion: Decimal?
    let valor_pesos: String?
}
