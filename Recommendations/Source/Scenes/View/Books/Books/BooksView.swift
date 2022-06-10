//
//  TypeBooksView.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 09.06.2022.
//

import Foundation
import UIKit

class BooksView: UIView {

    // MARK: - Private properties

    private var models = [Book]()
    weak var delegate: BookDelegate?

    // MARK: - Elements

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

    func configureView(with models: [Book]) {
        self.models = models
    }

    // MARK: - CompositionalLayout

    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in

            // item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 15)

            // group - vertical
            let innerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
            let innerGroup = NSCollectionLayoutGroup.vertical(layoutSize: innerGroupSize, subitems: [item])

            // section
            let section = NSCollectionLayoutSection(group: innerGroup)
            section.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 0)
            section.orthogonalScrollingBehavior = .groupPaging

            return section
        }
    }
}

// MARK: - Data Source

extension BooksView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BooksCollectionViewCell.identifier, for: indexPath) as? BooksCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: model)
        return cell
    }
}

// MARK: - Delegate

extension BooksView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.descriptionBook(description: models[indexPath.row])
    }
}
