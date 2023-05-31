//
//  NetworkManager.swift
//  CoctailApp
//
//  Created by Mine Rala on 30.05.2023.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func makeRequest<T: Decodable>(endpoint: Endpoint, type: T.Type, completed: @escaping (Result<T, CustomErrors>) -> Void)
}

protocol NetworkManagerDelegate: AnyObject {
    func allCoctailsFetched()
}

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    
    func makeRequest<T: Decodable>(endpoint: Endpoint, type: T.Type, completed: @escaping (Result<T, CustomErrors>) -> Void) {
        AF.request(endpoint.url).responseDecodable(of: T.self) { result in
            guard let result = result.value else {
                completed(.failure(.invalidData))
                return
            }
            completed(.success(result))
        }
    }
}
