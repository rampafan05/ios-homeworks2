//
//  AppCoordinator.swift
//  Navigation
//
//  Created by macbook on 06.12.2022.
//

import Foundation
import UIKit

protocol MainCoordinator {
    
    func startApplication() -> UIViewController
    
}

final class MainCoordinatorImp: MainCoordinator {
  
    func startApplication() -> UIViewController {
        return MainTabBarViewController()
        
    }
}
