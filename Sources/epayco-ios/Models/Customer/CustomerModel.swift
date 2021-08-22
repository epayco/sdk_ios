//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct CustomerModel: Codable {
    let status: Bool
    let message: String?
    let success: Bool?
    let type: String?
    let data: CustomerDataModel
}

struct CustomerDataModel: Codable {
    let status: String
    let description: String
    let customerId: String?
    let email: String?
    let name: String?
    let errors: String?
}
