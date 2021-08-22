//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/19/21.
//

import Foundation

struct SubscriptionListModel: Codable {
    let status: Bool?
    let success: Bool?
    let type: String?
    let message: String?
    let data: [SubscriptionListDataModel]?
}

struct SubscriptionListDataModel: Codable {
    let _id: String?
    let idPlan: String?
    let periodStart: String?
    let periodEnd: String?
    let nextVerificationDate: String?
    let status: String?
    let first: Bool?
    let idCustomer: String?
    let paymentAttempts: String?
    let tokenCard: String?
    let description: String?
    let errors: String?
    let plan: PlanGetDataModel?
}
