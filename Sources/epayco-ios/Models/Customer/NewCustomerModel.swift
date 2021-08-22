//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct NewCustomerModel: Encodable {
    let token_card: String
    let name: String
    let last_name: String
    let email: String
    let isDefault: Bool
    let city: String
    let address: String
    let phone: String
    let cell_phone: String
}
