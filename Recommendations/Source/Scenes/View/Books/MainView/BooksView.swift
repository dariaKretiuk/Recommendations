//
//  BooksView.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 03.06.2022.
//

import Foundation
import UIKit

final class BooksView: UIView {
    
    // MARK: - Private properties
    
    private var models = [TypeBooks]()
    
    // MARK: - Elements
    
    weak var delegate: BooksDelegate?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: viewLayout)
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .black
        setupHierarchy()
        setupCollection()
        setupLayout()
    }

    // MARK: - Private functions

    private func setupHierarchy() {
        addSubview(collectionView)
        collectionView.backgroundColor = .black
    }
    
    private func setupCollection() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BooksCollectionViewCell.self, forCellWithReuseIdentifier: BooksCollectionViewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    private func setupLayout() {

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    // MARK: - Configuration

    func configureView(with models: [TypeBooks]) {
        self.models = models
    }
    
    // MARK: - CompositionalLayout
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            // item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 15)
            
            // group - horizontal
            let innerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.23))
            let innerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: innerGroupSize, subitem: item, count: 2)
            
            // group - vertical
            let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: nestedGroupSize, subitems: [innerGroup])
            
            // section
            let section = NSCollectionLayoutSection(group: nestedGroup)
            section.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 0)
            section.orthogonalScrollingBehavior = .groupPaging
            
            return section
        }
    }
}

// MARK: - Data Source

extension BooksView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BooksCollectionViewCell.identifier, for: indexPath) as? BooksCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: model)
        cell.button.addTarget(self, action: #selector(self.chooseTypeBooks), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Выбрана ячейка: (\(indexPath.section), \(indexPath.item))")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("Выбрана ячейка: (\(indexPath.section), \(indexPath.item))")
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print("Выбрана ячейка: (\(indexPath.section), \(indexPath.item))")
        return true
    }
    
    // MARK: - Actions
    
    @objc func chooseTypeBooks(_ sender: UIButton) {
        print("choose \(sender.titleLabel?.text ?? "")")
        delegate?.chooseTypeBooks(nameType: sender.titleLabel?.text ?? "")
    }
}

// MARK: - Delegate

extension BooksView: UICollectionViewDelegate {
    
    
}
