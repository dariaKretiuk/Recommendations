//
//  AppDelegate.swift
//  Recommendations
//
//  Created by Дарья Кретюк on 03.06.2022.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // MARK: - Elements
    
    private let appearance: UINavigationBarAppearance =  {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .c131313
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        return appearance
    }()
    
    private let appearanceTabBar: UITabBarAppearance =  {
        let appearanceTabBar = UITabBarAppearance()
        appearanceTabBar.configureWithOpaqueBackground()
        appearanceTabBar.backgroundColor = .c131313
        return appearanceTabBar
    }()
    
    // MARK: - Private func
    
    private func settingsBar() {
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UITabBar.appearance().standardAppearance = appearanceTabBar
        UITabBar.appearance().scrollEdgeAppearance = appearanceTabBar
        UITabBar.appearance().tintColor = .ff585b
    }
    
    // MARK: - Main func


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        settingsBar()
        
        let tabBarController = UITabBarController()
        
        let receptsController = ReceptsController()
        let receptsNavigationController = UINavigationController(rootViewController: receptsController)
        receptsController.tabBarItem = UITabBarItem(title: "Рецепты", image: UIImage(systemName: "pencil.tip.crop.circle"), tag: 0)
        
        let booksController = TypeBookController()
        let booksNavigationController = UINavigationController(rootViewController: booksController)
        booksController.tabBarItem = UITabBarItem(title: "Книги", image: UIImage(systemName: "books.vertical.circle"), tag: 1)
        
        let filmsController = FilmsController()
        let filmsNavigationController = UINavigationController(rootViewController: filmsController)
        filmsController.tabBarItem = UITabBarItem(title: "Фильмы", image: UIImage(systemName: "film.circle"), tag: 2)
        
        tabBarController.setViewControllers([
            receptsNavigationController,
            booksNavigationController,
            filmsNavigationController
        ], animated: true)
        tabBarController.selectedIndex = 1
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

