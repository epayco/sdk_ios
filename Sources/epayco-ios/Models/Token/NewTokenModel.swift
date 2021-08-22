//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/12/21.
//

import Foundation

struct NewTokenModel: Encodable {
    let card: CardTokenModel
}

struct CardTokenModel: Encodable {
    let number: String
    let exp_year: String
    let exp_month: String
    let cvc: String
}
