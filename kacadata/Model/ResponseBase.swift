//
//  ResponseBase.swift
//  kacadata
//
//  Created by Ridho Saputra on 20/11/22.
//

import Foundation

struct ResponseBase<T: Codable>: Codable {
    var data: T
}
