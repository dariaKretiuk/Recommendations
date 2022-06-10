import Foundation

protocol TypesBookDelegate: class {
    func chooseTypeBooks(nameType: String)
}

protocol BookDelegate: class {
    func descriptionBook(description: Book)
}

protocol ModalViewDelegate: class {
    func closeDescription()
}
