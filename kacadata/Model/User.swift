//
//  User.swift
//  kacadata
//
//  Created by Ridho Saputra on 11/10/22.
//

import Foundation

struct User: Codable {
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var businessId: Int
    var businessName: String
    var outletIds: [Int]
    var outletNames: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case businessId = "business_id"
        case businessName = "business_name"
        case outletIds = "outlet_ids"
        case outletNames = "outlet_names"
    }
}
