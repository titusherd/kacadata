//
//  NetworkManager.swift
//  kacadata
//
//  Created by Titus Herdiawan
//

import Foundation
import Combine
import Alamofire

enum NetworkErrors: Error{
    case urlError
    case responseError
    case decoderError
    case unknownError
}
struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}

protocol ServiceProtocol{
    func getUserModelServiceData()-> AnyPublisher<UserModel,NetworkErrors>
}

class Service{
    static let shared = Service()
    private init(){}
}

extension Service: ServiceProtocol{
    
    
    func getUserModelServiceData() -> AnyPublisher<BusinessModel,NetworkErrors> {
//        let url = URL.get()
        return AF.request(url!,method: .get)
                     .publishDecodable(type: BusinessModel.self)
                     .value()
                     .mapError { _ in NetworkErrors.decoderError }
                     .eraseToAnyPublisher()
    }
    
    func getOutletModel()-> AnyPublisher<OutletModel,Error>{
//        let url = URL.get()!
        return AF.request(url, method: .get)
            .publishDecodable(type: OutletModel.self)
            .tryCompactMap { (response) -> TopTVShowsDataModel? in
                if let error = response.error { throw error }
                return response.value
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}




