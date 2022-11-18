//
//  ResponseToken.swift
//  kacadata
//
//  Created by Ridho Saputra on 14/11/22.
//

import Foundation

struct ResponseToken: Codable {
    var accessToken: String
    var tokenType: String
    var expiresIn: Int
    var refreshToken: String
    var scope: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case scope
    }
    
}
