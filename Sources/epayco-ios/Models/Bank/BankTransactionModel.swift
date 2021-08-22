//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct BankTransactionModel: Codable {
    let success: Bool
    let title_response: String
    let text_response: String
    let last_action: String
    let data: BankTransactionDataModel
}

struct BankTransactionDataModel: Codable {
    let totalerrores: Int?
    let errores: [PaymentErrorModel]?
    let ref_payco: Int?
    let factura: String?
    let description: String?
    let valor: String?
    let iva: String?
    let baseiva: String?
    let moneda: String?
    let estado: String?
    let respuesta: String?
    let autorizacion: String?
    let recibo: String?
    let fecha: String?
    let urlbanco: String?
    let transactionId: String?
    let ticketId: String?
}
