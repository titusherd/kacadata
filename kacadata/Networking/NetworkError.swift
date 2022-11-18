//
//  NetworkError.swift
//  kacadata
//
//  Created by Ridho Saputra on 15/11/22.
//

import Foundation
import Alamofire


struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
