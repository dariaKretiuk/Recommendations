//
//  BooksController.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 03.06.2022.
//

import Foundation
import UIKit

class BooksController: UIViewController {
    
    // MARK: - Elements
    
    private var model: BooksTypeModel?
    private var typesBooks = BooksView()
    
    
    private var booksView: BooksView? {
        guard isViewLoaded else { return nil }
        return view as? BooksView
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
        navigationItem.title = "Книги"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonRight)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonLeft)
    }
    
    // MARK: - Action
    
    @objc private func chooseTypeBook(_ sender: UIButton) {
        print("Выбран тип - \(sender.titleLabel?.text ?? "")")
    }
    
}

// MARK: - Configurations

private extension BooksController {
    func configureView() {
        guard let models = model?.createModels() else { return }
        booksView?.configureView(with: models)
    }
}

// MARK: - Delegate

extension BooksController: BooksDelegate {
    
    func chooseTypeBooks(nameType: String) {
        navigationController?.pushViewController(TypeBooksController(), animated: true)
    }
}
