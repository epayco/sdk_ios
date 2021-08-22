//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/15/21.
//

import Foundation

struct CustomerGetModel: Codable {
    let status: Bool
    let success: Bool?
    let message: String?
    let type: String?
    let data: CustomerGetDataModel
}

struct CustomerGetDataModel: Codable {
    let status: String?
    let description: String?
    let errors: String?
    let id_customer: String?
    let name: String?
    let created: String?
    let doc_type: String?
    let doc_number: String?
    let email: String?
    let phone: String?
    let address: String?
    let cards: [CustomerCardModel]?
}

struct CustomerCardModel: Codable {
    let token: String
    let franchise: String
    let mask: String
    let created: String
}
