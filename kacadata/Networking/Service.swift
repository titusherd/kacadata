//
//  NetworkManager.swift
//  kacadata
//
//  Created by Titus Herdiawan


import Foundation
import Combine
import Alamofire

protocol ServiceProtocol {
    func getAccessToken(_ code: String) -> AnyPublisher<ResponseToken, AFError>
}

class Service {
    static let shared: ServiceProtocol = Service()
    private init(){}
}

extension Service: ServiceProtocol {
    func getAccessToken(_ code: String) -> AnyPublisher<ResponseToken, AFError> {
        let url = URL(string:  Constant.baseUrl + "/oauth/token")!
        
        let param = [
            "client_id": Constant.clientId,
            "client_secret": Constant.clientSecret,
            "code": code,
            "grant_type": Constant.grantType,
            "redirect_uri": Constant.redirectUri
        ] as [String : Any]
        
        let headers: HTTPHeaders = ["Accept": "application/json"]
        
        return AF.request(url, method: .post, parameters: param, headers: headers)
            .validate()
            .publishDecodable(type: ResponseToken.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}




