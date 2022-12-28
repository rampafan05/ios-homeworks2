//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by macbook on 07.12.2022.
//

import Foundation
import UIKit

final class LoginCoordinator {
    func showDetils(coordinator: LoginCoordinator) -> UIViewController {
       let vc = LoginViewController(coordinator: coordinator)
        vc.view.backgroundColor = .white
        vc.navigationController?.navigationBar.isHidden = true
        return vc
    }
}

final class ProfileCoordinator {
    
    func showDetils(navCon: UINavigationController?, coordinator: ProfileCoordinator){
        
        let vc = ProfileViewController( userService: CurrentUserService() as UserService, login: "R", coordinator: coordinator)
        vc.view.backgroundColor = .systemGray6
        vc.title = "Profile"
        // MARK: NAVIGATION BAR
        vc.navigationController?.navigationBar.isHidden = false
        vc.navigationItem.hidesBackButton = true
        vc.navigationController?.navigationItem.largeTitleDisplayMode = .never
        vc.navigationController?.navigationBar.prefersLargeTitles = false
        
        navCon?.pushViewController(vc, animated: true)
        
    }
}
