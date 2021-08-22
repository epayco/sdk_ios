//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/16/21.
//

import Foundation

struct RemovePlanModel: Codable {
    let status: Bool
    let message: String
    let success: Bool
    let type: String
    let data: RemovePlanDataModel
}

struct RemovePlanDataModel: Codable {
    let idPlan: String
}
