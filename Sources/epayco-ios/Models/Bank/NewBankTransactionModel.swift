//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct NewBankTransactionModel: Encodable {
    let bank: String
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
    let country: String
    let cellPhone: String
    let responseUrl: String
    let confirmationUrl: String
    let confirmationMethod: String
    let ip: String
    let extra1: String
    let extra2: String
    let extra3: String
    let extra4: String
    let extra5: String
    let extra6: String
    let extra7: String
}
