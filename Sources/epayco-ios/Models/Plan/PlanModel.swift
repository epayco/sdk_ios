//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct PlanModel: Codable {
    let status: Bool
    let success: Bool?
    let message: String?
    let type: String?
    let data: PlanDataModel
}

struct PlanDataModel: Codable {
    let status: String?
    let id_plan: String?
    let name: String?
    let description: String
    let amount: Decimal?
    let currency: String?
    let interval: String?
    let interval_count: Int?
    let trial_days: Int?
    let test: Bool?
    let afterPayment: Int?
    let errors: String?
}
