//
//  TypeBookController.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 03.06.2022.
//

import Foundation
import UIKit

class TypeBookController: UIViewController {
    
    // MARK: - Elements
    
    private var model: BooksTypeModel?
    private var typesBooks = TypeBookView()
    
    
    private var booksView: TypeBookView? {
        guard isViewLoaded else { return nil }
        return view as? TypeBookView
    }
    
    private let buttonRight: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.tintColor = .ff585b
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonLeft: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setImage(UIImage(systemName: "list.bullet.circle"), for: .normal)
        button.tintColor = .ff585b
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = typesBooks
        typesBooks.delegate = self
        model = BooksTypeModel()
        
        configureView()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .c131313
        navigationItem.title = "Жанры книг"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonRight)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonLeft)
    }
}

// MARK: - Configurations

private extension TypeBookController {
    func configureView() {
        guard let models = model?.createModels() else { return }
        booksView?.configureView(with: models)
    }
}

// MARK: - Delegate

extension TypeBookController: TypesBookDelegate {
    
    func chooseTypeBooks(nameType: String) {
        navigationController?.pushViewController(BooksController(nameType: nameType), animated: true)
    }
}
