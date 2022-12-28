//
//  Factory.swift
//  Navigation
//
//  Created by macbook on 06.12.2022.
//

import Foundation
import UIKit

final class FactoryNavigation {
    
    enum Flow {
        case feed
        case login
    }
    
    let navigationController: UINavigationController
    let flow: Flow
    
    init(
        navigationController: UINavigationController,
        flow: Flow
    ) {
        self.navigationController = navigationController
        self.flow = flow
        startModule()
    }
    
    
    let item1 = UITabBarItem(title: "Feed", image: UIImage(systemName: "folder.fill.badge.person.crop"), tag: 0)

    let item2 = UITabBarItem(title: "Profile", image:  UIImage(systemName: "person.circle"), tag: 1)
    
    let inspector = MyLoginFactory.shared.returnLoginInspector()
    
    
    func startModule() {
        switch flow {
        case .feed:
//            let feedViewModel = FeedModel()
            let feedCoordinator = FeedCoordinator()
            let feedVC = feedCoordinator.showDeatils(coordinator: feedCoordinator)
            navigationController.tabBarItem = item1
            navigationController.setViewControllers([feedVC], animated: false)
            
        case .login:
           let loginCoordinator = LoginCoordinator()
            let loginVC = LoginViewController(coordinator: loginCoordinator)
            loginVC.loginDelegate = inspector
            navigationController.tabBarItem = item2
            navigationController.setViewControllers([loginVC], animated: false)
        }
    }
}
