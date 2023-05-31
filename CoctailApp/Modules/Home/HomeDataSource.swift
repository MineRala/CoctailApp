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
    var cellSize = CGSize(width: 170, height: 260)
    
    // MARK: - init
    init(coctails: [Coctail]) {
        self.coctails = coctails
    }
}

// MARK: CollectionView Protocols
extension HomeDataSource: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coctails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell {
            let coctail = coctails[indexPath.row]
            cell.setCell(model: CellModel(name: coctail.name, category: coctail.category, image: coctail.image))
            return cell}
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
       
    }
}
