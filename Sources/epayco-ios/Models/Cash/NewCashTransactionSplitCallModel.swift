//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/16/21.
//

import Foundation

struct NewCashTransactionSplitCallModel: Encodable {
    let factura: String
    let descripcion: String
    let valor: String
    let iva: String
    let baseiva: String
    let moneda: String
    let tipo_persona: String
    let tipo_doc: String
    let documento: String
    let nombres: String
    let apellidos: String
    let email: String
    let celular: String
    let fechaexpiracion: String
    let url_respuesta: String
    let url_confirmacion: String
    let metodoconfirmacion: String
    let public_key: String
    let enpruebas: Bool
    let ip: String
    let lenguaje: String
    let splitpayment: String
    let split_app_id: String
    let split_merchant_id: String
    let split_type: String
    let split_rule: String
    let split_primary_receiver: String
    let split_primary_receiver_fee: String
    let split_receivers: [SplitReceiverModel]
}
