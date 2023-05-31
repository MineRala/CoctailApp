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
    
    private lazy var collectionView: UICollectionView = { [unowned self] in
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .vertical
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black.withAlphaComponent(0.8)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        return collectionView
    }()
    
    // MARK: - Properties
    var interactor: HomeBusinessLogic?
    var dataSource: HomeDataSource?
    var router: HomeRoutingLogic?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor?.requestCoctails()
    }
}

// MARK: - UI
extension HomeViewController {
    private func setupUI() {
        configureNavigationController()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
        }
    }
    
    private func configureNavigationController() {
        view.backgroundColor = .black.withAlphaComponent(0.8)
        navigationController?.navigationBar.barTintColor = .black.withAlphaComponent(0.8)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Coctails"
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
}

// MARK: - HomeDataSourceDelegate
extension HomeViewController: HomeDataSourceDelegate {
    func selectedCoctail(_ coctail: Coctail) {
        router?.routerToDetail(coctail)
    }
}

// MARK: - HomeDisplayLogic
extension HomeViewController: HomeDisplayLogic {
    func displayCoctails(homeDataSource: HomeDataSource) {
        DispatchQueue.main.async {
            self.dataSource = homeDataSource
            self.collectionView.dataSource = self.dataSource
            self.collectionView.delegate = self.dataSource
            self.dataSource?.delegate = self
            if self.view.frame.width <= 375 {
                self.dataSource?.cellSize = CGSize(width: 160, height: 260)
            }
            self.collectionView.reloadData()
        }
    }
}
