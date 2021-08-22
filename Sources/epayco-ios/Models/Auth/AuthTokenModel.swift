//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/14/21.
//

import Foundation

struct AuthTokenModel: Codable {
    let status: Bool
    let message: String
    let bearer_token: String?
    let data: [String]?
}
