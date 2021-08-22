//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/17/21.
//

import Foundation

struct NewBankTransactionCallModel: Encodable {
    let banco: String?
    let factura: String?
    let descripcion: String?
    let valor: String?
    let iva: String?
    let baseiva: String?
    let moneda: String?
    let tipo_persona: String?
    let tipo_doc: String?
    let documento: String?
    let nombres: String?
    let apellidos: String?
    let email: String?
    let pais: String?
    let celular: String?
    let url_respuesta: String?
    let url_confirmacion: String?
    let metodoconfirmacion: String?
    let extra1: String?
    let extra2: String?
    let extra3: String?
    let extra4: String?
    let extra5: String?
    let extra6: String?
    let extra7: String?
    let public_key: String?
    let enpruebas: String?
    let ip: String?
    let lenguaje: String?
    let i: String?
}
