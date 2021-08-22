//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/16/21.
//

import Foundation

struct ChargedSubscriptionModel: Codable {
    let success: Bool?
    let title_response: String?
    let text_response: String?
    let last_action: String?
    let message: String?
    let periodStart: String?
    let periodEnd: String?
    let nextVerificationDate: String?
    let first: String?
    let idCustomer: String?
    let tokenCard: String?
    let ip: String?
    let url_confirmation: String?
    let method_confirmation: String?
    let data: ChargedSubscriptionDataModel
    let subscription: SubscriptionDataModel?
}

struct ChargedSubscriptionDataModel: Codable {
    let status: String?
    let description: String?
    let errors: String?
    let ref_payco: Int?
    let factura: String?
    let descripcion: String?
    let valor: String?
    let iva: String?
    let baseiva: Int?
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
}
