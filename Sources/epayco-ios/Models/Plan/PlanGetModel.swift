//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/16/21.
//

import Foundation

struct PlanGetModel: Codable {
    let status: Bool
    let success: Bool?
    let type: String?
    let message: String?
    let plan: PlanGetDataModel?
    let data: PlanGetDataModel?
}

struct PlanGetDataModel: Codable {
    let _id: String?
    let id_plan: String?
    let name: String?
    let description: String
    let amount: Decimal?
    let currency: String?
    let interval_count: Int?
    let interval: String?
    let status: String
    let trial_days: Int?
    let created: String?
}
