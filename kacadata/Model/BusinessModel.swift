//
//  Business.swift
//  kacadata
//
//  Created by Ridho Saputra on 11/10/22.
//

import Foundation

struct BusinessModel: Codable {
    var id: Int
    var name: String
    var address: String?
    var city: String?
    var province: String?
    var postalCode: String?
    var email: String?
    var phone: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case address
        case city
        case province
        case postalCode = "postal_code"
        case email
        case phone
    }
}
