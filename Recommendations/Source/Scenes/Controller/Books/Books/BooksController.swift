//
//  BooksController.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 06.06.2022.
//

import Foundation
import UIKit

class BooksController: UIViewController {
    
    // MARK: - Elements
        
    private var model: BooksModel?
    private var nameType: String
    private var books = BooksView()
    
    private var booksView: BooksView? {
        guard isViewLoaded else { return nil }
            return view as? BooksView
    }

    // MARK: - Lifecycle
    
    init(nameType: String) {
        self.nameType = nameType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = books
        books.delegate = self
        model = BooksModel()

        configureView()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .c131313
        navigationItem.title = "Каталог книг"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .ff585b
    }
}

// MARK: - Configurations

private extension BooksController {
    func configureView() {
        guard let models = model?.createModels(nameType: nameType) else { return }
        booksView?.configureView(with: models)
    }
}

// MARK: - Delegate

extension BooksController: BookDelegate {
    
    func descriptionBook(description: Book) {
        print("choose \(description.name)")
        let modelView = ModalWindowController(model: description)
        self.present(modelView, animated: true, completion: nil)
    }
}
