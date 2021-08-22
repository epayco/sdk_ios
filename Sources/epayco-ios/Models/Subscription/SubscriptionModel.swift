//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct SubscriptionModel: Codable {
    let status: Bool
    let message: String
    let created: String?
    let id: String?
    let success: Bool?
    let current_period_start: String?
    let current_period_end: String?
    let status_subscription: String?
    let type: String?
    let customer: SubscriptionCustomerModel?
    let data: SubscriptionDataModel
}

struct SubscriptionDataModel: Codable {
    let status: String?
    let description: String?
    let errores: String?
    let idClient: String?
    let name: String?
    let amount: Decimal?
    let currency: String?
    let interval: String?
    let interval_count: Int?
    let trial_days: Int?
    let createdAt: String?
}

struct SubscriptionCustomerModel: Codable {
    let _id: String
    let name: String
    let email: String
    let doc_number: String
    let merchantId: String
    let indicative: String?
    let country: String?
    let city: String
    let address: String
    let break_card: Bool
    let doc_type: String
    let updated_at: String
}

