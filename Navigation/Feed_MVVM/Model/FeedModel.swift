//
//  FeedModel.swift
//  Navigation
//
//  Created by macbook on 03.12.2022.
//

import Foundation
import UIKit

//MARK: Task 6. Part 2.Notitfication Centr Post


final class FeedModel {
    
    var  secretWord = "Пароль"
    
    func check(word: String) {
        if word == secretWord {
            NotificationCenter.default.post(name: NSNotification.Name("green"), object: nil)
        } else {
            NotificationCenter.default.post(name: NSNotification.Name("red"), object: nil)
        }
    }
    
}
          
