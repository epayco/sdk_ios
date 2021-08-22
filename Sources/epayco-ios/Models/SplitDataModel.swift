//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct SplitDataModel: Encodable {
    let splitpayment: String
    let split_app_id: String
    let split_merchant_id: String
    let split_type: String
    let split_rule: String
    let split_primary_receiver: String
    let split_primary_receiver_fee: String
    let split_receivers: [SplitReceiverModel]
}

struct SplitReceiverModel: Encodable {
    let id: String
    let fee: String
    let fee_type: String
    let total: String
}
