//
//  BooksCollectionViewCell.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 04.06.2022.
//

import Foundation
import UIKit

class BooksCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BooksCollectionViewCell"
    
    // MARK: - Elements
    
    weak var delegate: BooksDelegate?
    private var nameType: String?
    
    public let button: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.ff585b.cgColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    // MARK: - Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayouts()
        contentView.clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    // MARK: - Private func
    
    private func setupHierarchy() {
        contentView.addSubview(button)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.rightAnchor.constraint(equalTo: rightAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leftAnchor.constraint(equalTo: leftAnchor),
            button.widthAnchor.constraint(equalToConstant: frame.width),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    // MARK: - Configuration
    
    public func configure(with model: TypeBooks) {
        nameType = model.title
        button.setBackgroundImage(UIImage(named: model.icon), for: .normal)
        button.setTitle(model.title, for: .normal)
    }
}
