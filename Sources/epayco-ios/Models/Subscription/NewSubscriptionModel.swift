//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct NewSubscriptionModel: Encodable {
    let id_plan: String
    let customer: String
    let token_card: String
    let doc_type: String
    let doc_number: String
    let url_confirmation: String?
    let method_confirmation: String?
}
