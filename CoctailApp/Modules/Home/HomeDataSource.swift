//
//  HomeDataSource.swift
//  CoctailApp
//
//  Created by Mine Rala on 29.05.2023.
//

import UIKit

protocol HomeDataSourceDelegate: AnyObject {
    func selectedCoctail(_ coctail: Coctail)
}

class HomeDataSource: NSObject {
    // MARK: - Properties
    var coctails: [Coctail]
    public weak var delegate: HomeDataSourceDelegate?

    // MARK: - init
    init(coctails: [Coctail]) {
        self.coctails = coctails
    }
}

// MARK: - UITableViewDataSource
extension HomeDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coctails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell else { return UITableViewCell() }
        let coctail = coctails[indexPath.row]
        cell.setCell(model: CellModel(name: coctail.name, category: coctail.category, image: coctail.image))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

// MARK: - UITableViewDelegate
extension HomeDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coctail = coctails[indexPath.row]
        delegate?.selectedCoctail(coctail)
    }
}

