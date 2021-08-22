//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct NewCashTransactionModel: Encodable {
    let invoice: String
    let description: String
    let value: String
    let tax: String
    let taxBase: String
    let currency: String
    let personType: String
    let docType: String
    let docNumber: String
    let name: String
    let lastName: String
    let email: String
    let cellPhone: String
    let endDate: String
    let ip: String
    let responseUrl: String
    let confirmationUrl: String
    let confirmationMethod: String
}
