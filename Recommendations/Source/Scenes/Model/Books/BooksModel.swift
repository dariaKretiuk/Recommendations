//
//  BooksModel.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 03.06.2022.
//

import Foundation

final class BooksModel {
    
    private let model = [
        "Художественная литература": [
            Book(name: "Темные башни", author: "Стивен Кинг", image: "theDarkTower", urlBook: nil, rating: nil, review: nil, isRead: false) {
                print("Нажата книга \"Темные башни\"")
            },
            Book(name: "Остров", author: "Олдос Хаксли", image: "island", urlBook: nil, rating: 5, review: nil, isRead: true) {
                print("Нажата книга \"Остров\"")
            }
        ],
        "Психология": [
            Book(name: "Воспитывая счастливых людей", author: "Любовь Сурудо", image: "happyPeople", urlBook: nil, rating: nil, review: nil, isRead: true) {
                print("Нажата книга \"Воспитывая счастливых людей\"")
            }
        ],
        "Учебная литература": [
            Book(name: "Swift", author: "Усов Василий Александрович", image: "swift", urlBook: nil, rating: nil, review: nil, isRead: false) {
                print("Нажата книга \"Swift\"")
            }
        ]
    ]
    
    func createModels(nameType: String) -> [Book] {
        return self.model[nameType] ?? []
    }
}
