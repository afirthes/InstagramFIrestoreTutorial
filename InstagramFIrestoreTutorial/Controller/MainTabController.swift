//
//  MainTabController.swift
//  InstagramFIrestoreTutorial
//
//  Created by Icetusk on 22.06.2024.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarStyle()
        configureViewControllers()
    }
    
    // MARK: - Helpers
    
    func configureTabBarStyle() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .blue
            appearance.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 34),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    func configureViewControllers() {
        
        view.backgroundColor = .white
        
        let feed = templateNavigationController("home_unselected", "home_selected", FeedController())
        let search = templateNavigationController("search_unselected", "search_selected", SearchController())
        let imageSelector = templateNavigationController("plus_unselected", "plus_unselected", ImageSelectorController())
        let notifications = templateNavigationController("like_unselected", "line_selected", NotificationController())
        let profile = templateNavigationController("profile_unselected", "profile_selected", ProfileController())
        
        viewControllers = [feed, search, imageSelector, notifications, profile]
        
        tabBar.isTranslucent = false
    }
    
    func templateNavigationController(_ unselectedImage: String, _ selectedImage: String, _ rootViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = UIImage(named: unselectedImage)
        nav.tabBarItem.selectedImage = UIImage(named: selectedImage)
        nav.navigationBar.tintColor = .black
        nav.navigationBar.isTranslucent = false
        
        return nav
    }
    
    
    
}
