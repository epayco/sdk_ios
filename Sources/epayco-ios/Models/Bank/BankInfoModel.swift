//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct BankInfoModel: Codable {
    let success: Bool
    let title_response: String
    let text_response: String
    let last_action: String
    let data: [BankInfoDataModel]
}

struct BankInfoDataModel: Codable {
    let bankCode: String
    let bankName: String
}
