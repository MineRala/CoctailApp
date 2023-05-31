//
//  Enpoint.swift
//  CoctailApp
//
//  Created by Mine Rala on 30.05.2023.
//

import Foundation

//https://www.thecocktaildb.com/api/json/v1/1
//http://www.omdbapi.com/?i=movieIMBID=&apikey=48a7fc03

enum Endpoint {
    enum Constant {
        static let baseURL = "https://www.thecocktaildb.com/api/json/v1/1"
    }

    case allCoctails
   // case detailMovie(movieIMBID: String)
    
    var url: URL? {
        switch self {
        case .allCoctails:
            return URL(string: "\(Constant.baseURL)/search.php?f=M")
//        case .detailMovie(let movieIMBID):
//            return "\(Constant.baseURL)?i=\(movieIMBID)&apikey=\(Constant.apiKey)"
        }
    }
}
