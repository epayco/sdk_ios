//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/16/21.
//

import Foundation

struct CancelledSubscriptionModel: Codable {
    let status: Bool
    let message: String
    let success: Bool?
    let type: String?
    let data: CancelledSubscriptionDataModel
}

struct CancelledSubscriptionDataModel: Codable {
    let status: String?
    let description: String
}
