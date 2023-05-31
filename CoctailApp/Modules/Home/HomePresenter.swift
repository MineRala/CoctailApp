//
//  HomePresenter.swift
//  CoctailApp
//
//  Created by Mine Rala on 29.05.2023.
//

import Foundation

protocol HomePresentationLogic {
    func presentCoctailsData(_ coctails: [Coctail])
}

final class HomePresenter {
    // Mark: - Properties
    public weak var viewController: HomeDisplayLogic?
    
}

extension HomePresenter: HomePresentationLogic {
    func presentCoctailsData(_ coctails: [Coctail]) {
        viewController?.displayCoctails(homeDataSource: HomeDataSource(coctails: coctails))
    }
    
    
}
