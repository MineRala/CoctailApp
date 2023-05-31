//
//  Coctail.swift
//  CoctailApp
//
//  Created by Mine Rala on 29.05.2023.
//

import Foundation

struct AllCoctails: Decodable {
    let drinks: [Coctail]
}

struct Coctail: Decodable {
    let id: String
    let name: String
    let category: String
    let alcoholic: String
    let glass: String
    let desc: String
    let image: String
    
    public enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case category = "strCategory"
        case alcoholic = "strAlcoholic"
        case glass = "strGlass"
        case desc = "strInstructions"
        case image = "strDrinkThumb"
    }
}
