//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct NewChargeTransactionModel: Encodable {
    let token_card: String
    let customer_id: String
    let doc_type: String
    let doc_number: String
    let name: String
    let last_name: String
    let email: String
    let bill: String
    let description: String
    let value: String
    let tax: String
    let tax_base: String
    let currency: String
    let dues: String
    let address: String
    let phone: String
    let cell_phone: String
    let url_response: String
    let url_confirmation: String
    let ip: String
    let extras: ExtrasModel?
}
