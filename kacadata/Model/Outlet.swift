//
//  Outlet.swift
//  kacadata
//
//  Created by Ridho Saputra on 11/10/22.
//

import Foundation

struct Outlet: Codable {
    var id: Int
    var name: String
    var address: String?
    var phoneNumber: String?
    var city: String?
    var postalCode: String?
    var latitude: Float?
    var longitude: Float?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case address
        case phoneNumber = "phone_number"
        case city
        case postalCode = "postal_code"
        case latitude
        case longitude
    }
}
