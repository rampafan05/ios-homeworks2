//
//  User.swift
//  Navigation
//
//  Created by macbook on 14.11.2022.
//

import Foundation
import UIKit

//MARK: CLASS User
class User {
    
    var login: String
    var fullName: String
    var avatar: UIImage?
    var status: String
    
    init(login: String, fullName: String, avatar: UIImage,status: String){
        self.fullName = fullName
        self.avatar = avatar
        self.login = login
        self.status = status
    }
}
//MARK: PROTOCOL UserService
protocol UserService {

    func userService(login: String) -> User?
}

class CurrentUserService: UserService {
    
    var user = User( login: "R", fullName: "Рыжий Кот", avatar: UIImage(named: "kot")!, status: "Времененно не женат")
    
    func userService(login: String) -> User? {
        guard login == user.login else { return nil }
        return self.user
    }
    
}
  
class TestUserService: UserService {
    
    var user = User( login: "R", fullName: "Собака Королевы", avatar: UIImage(named: "tests")!, status: "На работе, не беспокоить")
    
    func userService(login: String) -> User? {
        guard login == user.login else { return nil }
        return self.user
    }
    
}
