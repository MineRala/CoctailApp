//
//  HomeConfigurator.swift
//  CoctailApp
//
//  Created by Mine Rala on 29.05.2023.
//

import Foundation

struct HomeConfigurator {
    static func createScene() -> HomeViewController {
        let viewController =  HomeViewController()
        let presenter = HomePresenter()
        let interactor =  HomeInteractor()
        let router = HomeRouter()
        let worker = HomeWorker()
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        viewController.router = router
        router.viewController = viewController
        return viewController
    }
}
