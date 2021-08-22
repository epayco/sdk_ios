//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/15/21.
//

import Foundation

struct CustomerListModel: Codable {
    let status: Bool
    let success: Bool
    let type: String
    let data: [CustomerListDataModel]
}

struct CustomerListDataModel: Codable {
    let id_customer: String
    let email: String
    let name: String
    let doc_number: String
    let created: String
}
