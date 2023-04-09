//
//  Factory.swift
//  Navigation
//
//  Created by macbook on 22.11.2022.
//

import UIKit

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory {
    
    static let shared = MyLoginFactory()
    
    func returnLoginInspector() -> LoginInspector {
        let inspector = LoginInspector()
        return inspector
    }
}
