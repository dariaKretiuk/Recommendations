
import Foundation
import UIKit

class BooksCollectionViewCell: UICollectionViewCell {

    static let identifier = "BooksCollectionViewCell"

    // MARK: - Elements
    
    private var model: Book?

    private let imageConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        return view
    }()

    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .gray
        image.backgroundColor = .f5cac5
        image.layer.cornerRadius = 10
        image.image = UIImage(systemName: "person.fill.questionmark")
        image.contentMode = .left
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
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
    
    private let buttonConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.contentMode = .bottomLeft
        return view
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.tintColor = .ff585b
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .c1C1C1C
        stackView.layer.cornerRadius = 20
        stackView.layer.borderWidth = 2
        stackView.layer.borderColor = UIColor.ff585b.cgColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        iconImage.image = nil
        nameBook.text = nil
        imageConteiner.backgroundColor = nil
    }

    // MARK: - Private func

    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(imageConteiner)
        imageConteiner.addSubview(iconImage)
        stackView.addArrangedSubview(nameBook)
        stackView.addArrangedSubview(buttonConteiner)
        buttonConteiner.addSubview(button)
    }

    private func setupLayouts() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            
            imageConteiner.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageConteiner.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            imageConteiner.widthAnchor.constraint(equalToConstant: 80),
            imageConteiner.heightAnchor.constraint(equalToConstant: 80),
            
            iconImage.centerYAnchor.constraint(equalTo: imageConteiner.centerYAnchor),
            iconImage.centerXAnchor.constraint(equalTo: imageConteiner.centerXAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 70),
            iconImage.heightAnchor.constraint(equalToConstant: 60),
            
            nameBook.leftAnchor.constraint(equalTo: imageConteiner.rightAnchor, constant: 10),
            nameBook.trailingAnchor.constraint(equalTo: buttonConteiner.leadingAnchor),
            
            buttonConteiner.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            buttonConteiner.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            buttonConteiner.widthAnchor.constraint(equalToConstant: 80),
            buttonConteiner.heightAnchor.constraint(equalToConstant: 80),
            
            button.centerYAnchor.constraint(equalTo: buttonConteiner.centerYAnchor),
            button.rightAnchor.constraint(equalTo: buttonConteiner.rightAnchor, constant: -10),
            button.widthAnchor.constraint(equalToConstant: 80),
            button.heightAnchor.constraint(equalToConstant: 80),
        ])
    }

    // MARK: - Configuration

    public func configure(with model: Book) {
        self.model = model
        nameBook.text = model.name
        button.setImage(UIImage(systemName: (self.model?.isRead ?? false) ? "book.circle.fill" : ("book.circle")), for: .normal)
        button.addTarget(self, action: #selector(changeIsRead), for: .touchUpInside)
        
        guard let icon = model.image else {
            return
        }
        iconImage.image = UIImage(named: icon)
    }
    
    // MARK: - Action
    
    @objc func changeIsRead(_ sender: UIButton) {
        guard let _ = self.model else {
            return
        }
        self.model?.isRead.toggle()
        button.setImage(UIImage(systemName: (self.model?.isRead ?? false) ? "book.circle.fill" : ("book.circle")), for: .normal)
    }
}
