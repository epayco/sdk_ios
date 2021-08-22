//
//  File.swift
//  
//
//  Created by Roberto Meran on 3/26/21.
//

import Foundation

struct TokenModel: Codable {
    let status: Bool
    let data: TokenDataModel
    let message: String?
    let id: String?
    let success: Bool?
    let card: TokenCardModel?
}

struct TokenDataModel: Codable {
    let status: String
    let id: String?
    let description: String?
    let created: String?
    let livemode: Bool?
    let errors: String?
}

struct TokenCardModel: Codable {
    let exp_month: String
    let exp_year: String
    let name: String
    let mask: String
}
