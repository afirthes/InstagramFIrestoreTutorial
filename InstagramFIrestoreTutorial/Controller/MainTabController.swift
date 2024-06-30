//
//  MainTabController.swift
//  InstagramFIrestoreTutorial
//
//  Created by Icetusk on 22.06.2024.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        checkIfUserIsLoggedIn()
    }
    
    // MARK: - API
    
//    func fetchUser() {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        UserService.fetchUser(withUid: uid) { user in
//            self.user = user
//        }
//    }
     
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
//                controller.delegate = self
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }

    
    // MARK: - Helpers
    
    func configureViewControllers() {
        
        view.backgroundColor = .white
        
        let  layout = UICollectionViewFlowLayout()
        
        let feed = templateNavigationController("home_unselected", "home_selected", FeedController(collectionViewLayout: layout))
        let search = templateNavigationController("search_unselected", "search_selected", SearchController())
        let imageSelector = templateNavigationController("plus_unselected", "plus_unselected", ImageSelectorController())
        let notifications = templateNavigationController("like_unselected", "line_selected", NotificationController())
        let profile = templateNavigationController("profile_unselected", "profile_selected", ProfileController())
        
        self.viewControllers = [feed, search, imageSelector, notifications, profile]
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
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
