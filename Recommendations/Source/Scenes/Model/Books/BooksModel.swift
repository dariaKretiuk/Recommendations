//
//  BooksModel.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 03.06.2022.
//

import Foundation

final class BooksModel {
    
    func createModels() -> [Section] {
        return [
            Section(title: "Художественная литература", icon: "backgroundBook2", options: [
                Book(name: "Темные башни", author: "Стивен Кинг", image: "theDarkTower", urlBook: nil, rating: nil, review: nil) {
                    print("Нажата книга \"Темные башни\"")
                },
                Book(name: "Остров", author: "Олдос Хаксли", image: "island", urlBook: nil, rating: 5, review: nil) {
                    print("Нажата книга \"Остров\"")
                }
            ]),
            Section(title: "Психология", icon: "backgroundBook", options: [
                Book(name: "Воспитывая счастливых людей", author: "Любовь Сурудо", image: "happyPeople", urlBook: nil, rating: nil, review: nil) {
                    print("Нажата книга \"Воспитывая счастливых людей\"")
                }
            ]),
            Section(title: "Учеба", icon: "backgroundBook", options: [
                Book(name: "Swift", author: "Усов Василий Александрович", image: "swift", urlBook: nil, rating: nil, review: nil) {
                    print("Нажата книга \"Swift\"")
                }
            ])
        ]
    }
}
