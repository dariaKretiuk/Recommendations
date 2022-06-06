//
//  TypeBooksController.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 06.06.2022.
//

import Foundation
import UIKit

class TypeBooksController: UIViewController {
    
    // MARK: - Views
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Press me", for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    // MARK: - Initilal
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(button)
    }
    
    private func setupLayout() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
