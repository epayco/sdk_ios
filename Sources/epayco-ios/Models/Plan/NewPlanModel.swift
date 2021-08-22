//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct NewPlanModel: Encodable {
    let id_plan: String
    let name: String
    let description: String
    let amount: Decimal
    let currency: String
    let interval: String
    let interval_count: Int
    let trial_days: Int
}
