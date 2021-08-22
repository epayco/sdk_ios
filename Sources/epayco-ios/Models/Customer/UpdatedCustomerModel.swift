//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/15/21.
//

import Foundation

struct UpdatedCustomerModel: Codable {
    let status: Bool
    let message: String?
    let success: Bool?
    let type: String?
    let data: UpdatedCustomerDataModel
}

struct UpdatedCustomerDataModel: Codable {
    let status: String
    let description: String
    let customerId: String?
    let name: String?
    let email: String?
}
