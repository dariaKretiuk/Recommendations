//
//  FilmsController.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 03.06.2022.
//

import Foundation
import UIKit

class FilmsController: UIViewController {
    
    // MARK: - Elements
    
//    private var model: BooksModel?
    
//    private var booksView: BooksView? {
//        guard isViewLoaded else { return nil }
//        return view as? BooksView
//    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view = BooksView()
//        model = BooksModel()
//
//        configureView()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .red
        navigationItem.title = "Фильмы"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

// MARK: - Configurations

private extension BooksController {
//    func configureView() {
//        guard let models = model?.createModels() else { return }
//        booksView?.configureView(with: models)
//    }
}

