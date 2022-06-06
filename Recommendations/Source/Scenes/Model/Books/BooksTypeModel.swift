//
//  BooksTypeModel.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 05.06.2022.
//

import Foundation

final class BooksTypeModel {
    
    func createModels() -> [TypeBooks] {
        return [
            TypeBooks(title: "Художественная литература", icon: "backgroundBook"),
            TypeBooks(title: "Психология", icon: "backgroundBook2"),
            TypeBooks(title: "Учебная литература", icon: "backgroundBook2")
        ]
    }
}
