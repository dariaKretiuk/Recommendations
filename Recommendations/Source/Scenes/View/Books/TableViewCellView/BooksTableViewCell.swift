//
//  BooksTableViewCell.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 03.06.2022.
//

import Foundation
import UIKit

class BooksTableViewCell: UITableViewCell {
    
    static let identifier = "BooksTableViewCell"
    
    // MARK: - Elements
    private let imageConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.contentMode = .left
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .gray
        image.backgroundColor = .f5cac5
        image.layer.cornerRadius = 10
        image.image = UIImage(systemName: "person.fill.questionmark")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameBook: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.backgroundColor = .lightGray
//        stackView.layer.cornerRadius = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initial
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayouts()
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        iconImage.image = nil
        nameBook.text = nil
        imageConteiner.backgroundColor = nil
    }
    
    // MARK: - Private func
    
    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(imageConteiner)
        stackView.addArrangedSubview(nameBook)
        imageConteiner.addSubview(iconImage)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.widthAnchor.constraint(equalToConstant: frame.width),
            imageConteiner.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageConteiner.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageConteiner.widthAnchor.constraint(equalToConstant: 80),
            imageConteiner.heightAnchor.constraint(equalToConstant: 80),
            iconImage.centerYAnchor.constraint(equalTo: imageConteiner.centerYAnchor),
            iconImage.centerXAnchor.constraint(equalTo: imageConteiner.centerXAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 70),
            iconImage.heightAnchor.constraint(equalToConstant: 60),
//            nameSetting.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
//            nameSetting.leftAnchor.constraint(equalTo: settingImageViewContainer.rightAnchor, constant: 5),
//            nameSetting.trailingAnchor.constraint(equalTo: additionalLabel.leadingAnchor),
//            additionalLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
//            additionalLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor)
        ])
    }
    
    // MARK: - Configuration
    
    public func configure(with model: Book) {
        nameBook.text = model.name
        guard let icon = model.image else {
            return
        }
        iconImage.image = UIImage(named: icon)
    }
}
