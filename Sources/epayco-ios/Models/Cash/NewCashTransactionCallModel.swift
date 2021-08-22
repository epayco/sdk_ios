//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/16/21.
//

import Foundation

struct NewCashTransactionCallModel: Encodable {
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
}
