//
//  Checker.swift
//  Navigation
//
//  Created by macbook on 20.11.2022.
//

import UIKit

class Checker {
    
    static let shared = Checker()
    
    private init() {}
    
    private let login = "R"
    private let password = "1"
    
    func chek(_ login1: String, _ password1: String) -> Bool{
        guard login1 == self.login && password1 == self.password else { return false }
            return true

    }
}

protocol LoginViewControllerDelegate{
    
    func check(_ login1: String, _ password1: String) -> Bool
}

struct LoginInspector: LoginViewControllerDelegate {
    
    func check(_ login1: String, _ password1: String) -> Bool {
        return Checker.shared.chek(login1, password1)
    }
    
    
  
    
}
