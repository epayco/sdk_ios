//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/16/21.
//

import Foundation

struct SubscriptionGetModel: Codable {
    let status: Bool
    let message: String?
    let created: String?
    let id: String?
    let success: Bool?
    let current_period_start: String?
    let current_period_end: String?
    let status_plan: String?
    let type: String?
    let customer: String?
    let plan: SubscriptionGetPlanModel?
    let data: SubscriptionGetDataModel?
}

struct SubscriptionGetPlanModel: Codable {
    let _id: String
    let idClient: String
    let name: String
    let description: String
    let amount: Decimal
    let currency: String
    let interval: String
    let interval_count: Int
    let status: String
    let trialDays: Int
}

struct SubscriptionGetDataModel: Codable {
    let status: String
    let description: String
    let errors: String
}
