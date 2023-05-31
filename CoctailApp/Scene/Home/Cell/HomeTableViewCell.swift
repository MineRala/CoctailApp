//
//  HomeTableViewCell.swift
//  CoctailApp
//
//  Created by Mine Rala on 29.05.2023.
//

import UIKit
import SnapKit
import Kingfisher

private enum HomeTableViewCellConstnt {
    static let viewColor = Color.cellBackgrounColor
    static let borderColor = Color.black
}

// MARK: - Model
public struct CellModel {
    var name: String
    var category: String
    var image: String
}

final class HomeTableViewCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = HomeTableViewCellConstnt.viewColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = HomeTableViewCellConstnt.borderColor.withAlphaComponent(0.3).cgColor
        view.layer.cornerRadius = 12
        return view
    }()

    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = Color.black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = Color.black
        label.textAlignment = .left
        return label
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
        titleLabel.text = nil
        categoryLabel.text = nil
    }
}

//MARK: - Configure Cell
extension HomeTableViewCell {
    private func configureCell() {
        contentView.addSubview(containerView)
    
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.left.right.equalToSuperview()
        }
        
        containerView.addSubview(posterImageView)
        
        posterImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.top.left.equalToSuperview().offset(8)
            make.width.equalToSuperview().multipliedBy(0.35)
        }
        
        containerView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.top)
            make.left.equalTo(posterImageView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        containerView.addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(titleLabel.snp.left)
            make.height.equalTo(32)
            make.width.equalTo(80)
        }
    }
}

//MARK: - Set Cell
extension HomeTableViewCell {
    func setCell(model: CellModel) {
        posterImageView.kf.setImage(with: URL(string: model.image))
        titleLabel.text = model.name
        categoryLabel.text = model.category
    }
}
