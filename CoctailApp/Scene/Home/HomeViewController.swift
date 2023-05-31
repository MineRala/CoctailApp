//
//  HomeViewController.swift
//  CoctailApp
//
//  Created by Mine Rala on 29.05.2023.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayCoctails(homeDataSource: HomeDataSource)
}

final class HomeViewController: UIViewController {
    
  private  lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        return tableView
    }()
    
    // MARK: - Properties
    var interactor: HomeBusinessLogic?
    var dataSource: HomeDataSource?
    var router: HomeRoutingLogic?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "Coctails"
        setupUI()
        interactor?.requestCoctails()
    }
}

// MARK: - UI
extension HomeViewController {
    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}

// MARK: - HomeDataSourceDelegate
extension HomeViewController: HomeDataSourceDelegate {
    func selectedCoctail(_ coctail: Coctail) {
        router?.routerToDetail(coctail)
    }
}

// MARK: -
extension HomeViewController: HomeDisplayLogic {
    func displayCoctails(homeDataSource: HomeDataSource) {
        DispatchQueue.main.async {
            self.dataSource = homeDataSource
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self.dataSource
            self.dataSource?.delegate = self
            self.tableView.reloadData()
        }
    }
}
