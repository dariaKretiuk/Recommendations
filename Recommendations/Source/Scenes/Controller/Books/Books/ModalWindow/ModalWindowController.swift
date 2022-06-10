//
//  ModalWindowController.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 10.06.2022.
//

import Foundation
import UIKit

class ModalWindowController: UIViewController {
    
    // MARK: - Elements
    
    private var modalView = ModalWindowView()
    private var model: Book?
    
    private var modalWindowView: ModalWindowView? {
        guard isViewLoaded else { return nil }
            return view as? ModalWindowView
    }
    
    // MARK: - Lifecycle
        
    init(model: Book) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        view = modalView
        modalView.delegate = self
        
        configureView()
        setupView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
    }
}

// MARK: - Configurations

private extension ModalWindowController {
    
    func configureView() {
        guard let models = model else { return }
        modalView.configureView(with: models)
    }
}

// MARK: - Delegate

extension ModalWindowController: ModalViewDelegate {
    
    func closeDescription() {
        self.dismiss(animated: true, completion: nil)
    }
}
