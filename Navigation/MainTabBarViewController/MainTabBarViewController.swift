//
//  MainTabBarViewController.swift
//  Navigation
//
//  Created by macbook on 06.12.2022.
//

import Foundation
import UIKit
class MainTabBarViewController: UITabBarController {
    

    private let firstVC = FactoryNavigation(navigationController: UINavigationController(), flow: .feed)
    
    private let secondVC = FactoryNavigation(navigationController: UINavigationController(), flow: .login )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setControllers()
    }
    
    private func setControllers() {
        viewControllers = [
            firstVC.navigationController,
            secondVC.navigationController
        ]
    }
    
}
