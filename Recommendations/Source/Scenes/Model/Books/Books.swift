//
//  Books.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 03.06.2022.
//

import Foundation

struct Section {
    let title: String
    let icon: String
    let options: [Book]
}

struct Book {
    let name: String
    let author: String?
    let image: String?
    let urlBook: String?
    let rating: Int?
    let review: String?
    let handler: (() -> Void)
}

struct TypeBooks {
    let title: String
    let icon: String
}
