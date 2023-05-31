//
//  HomeInteractor.swift
//  CoctailApp
//
//  Created by Mine Rala on 29.05.2023.
//

import Foundation

protocol HomeBusinessLogic {
    func requestCoctails()
}

final class HomeInteractor {
    // MARK: - Properties
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
}

extension HomeInteractor: HomeBusinessLogic {
    func requestCoctails() {
        worker?.getCoctails(completion: { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let allCoctails):
                self.presenter?.presentCoctailsData(allCoctails.drinks)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    
}
