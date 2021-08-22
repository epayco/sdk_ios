//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/17/21.
//

import Foundation

struct ChargeTransactionGetModel: Codable {
    let success: Bool
    let title_response: String
    let text_response: String
    let last_action: String
    let data: ChargeTransactionDataModel?
}
