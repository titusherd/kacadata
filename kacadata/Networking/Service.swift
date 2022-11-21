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
    func getProfile(_ accessToken: String) -> AnyPublisher<ResponseUser, AFError>
    func getItemSales(_ accessToken: String, _ outletId: Int) -> AnyPublisher<ResponseBase<[ItemSalesModel]>, AFError>
}

class Service {
    static let shared: ServiceProtocol = Service()
    private init(){}
}

extension Service: ServiceProtocol {
    func getItemSales(_ accessToken: String, _ outletId: Int) -> AnyPublisher<ResponseBase<[ItemSalesModel]>, AFError> {
        let url = URL(string:  Constant.baseUrl + "/v3/outlets/\(outletId)/reports/item_sales")!
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
        
        return AF.request(url, method: .get, headers: headers)
            .validate()
            .publishDecodable(type: ResponseBase<[ItemSalesModel]>.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getProfile(_ accessToken: String) -> AnyPublisher<ResponseUser, AFError> {
        let url = URL(string:  Constant.baseUrl + "/v1/profile/self")!
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
        
        print("Token \(accessToken)")
        
        return AF.request(url, method: .get, headers: headers)
            .validate()
            .publishDecodable(type: ResponseUser.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
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




