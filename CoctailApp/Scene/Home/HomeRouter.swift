//
//  HomeRouter.swift
//  CoctailApp
//
//  Created by Mine Rala on 29.05.2023.
//

import Foundation

protocol HomeRoutingLogic: AnyObject {
    func routerToDetail(_ coctail: Coctail)
}

class HomeRouter: HomeRoutingLogic {
    
    // MARK: - Properties
    weak var viewController: HomeViewController?
    
    
    func routerToDetail(_ coctail: Coctail) {
        print("Coctail: \(coctail)")
    }
}
