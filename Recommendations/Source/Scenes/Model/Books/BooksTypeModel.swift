import Foundation

final class BooksTypeModel {
    
    func createModels() -> [TypeBooks] {
        return [
            TypeBooks(title: "Художественная литература", icon: "backgroundBook2"),
            TypeBooks(title: "Психология", icon: "backgroundBook2"),
            TypeBooks(title: "Учебная литература", icon: "backgroundBook2")
        ]
    }
}
