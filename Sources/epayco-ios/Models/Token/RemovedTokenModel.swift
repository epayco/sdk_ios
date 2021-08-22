//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/15/21.
//

import Foundation

struct RemovedTokenModel: Codable {
    let status: Bool
    let message: String
    let success: Bool?
    let type: String?
    let data: RemovedTokenDataModel
}

struct RemovedTokenDataModel: Codable {
    let status: String?
    let description: String?
    let errors: String?
}
