//
//  HomeWorker.swift
//  CoctailApp
//
//  Created by Mine Rala on 29.05.2023.
//

import Foundation

typealias CoctailResult = Result<AllCoctails, CustomErrors>

class HomeWorker {
    
    func getCoctails(completion: @escaping (CoctailResult) -> Void) {
        NetworkManager.shared.makeRequest(endpoint: .allCoctails, type: AllCoctails.self) { result in
            switch result {
            case .success(let coctails):
                completion(.success(coctails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}
