//
//  Enpoint.swift
//  CoctailApp
//
//  Created by Mine Rala on 30.05.2023.
//

import Foundation

//https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a

enum Endpoint {
    enum Constant {
        static let baseURL = "https://www.thecocktaildb.com/api/json/v1/1"
    }

    case allCoctails
    
    var url: String {
        switch self {
        case .allCoctails:
            return "\(Constant.baseURL)/search.php?f=a"
        }
    }
}
