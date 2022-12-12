//
//  FeedModel.swift
//  Navigation
//
//  Created by macbook on 03.12.2022.
//

import Foundation
import UIKit

//MARK: Task 6. Part 2.Notitfication Centr Post
class FeedModel {
    
    var  secretWord = "Пароль"
    
    func check(word: String) {
        if word == secretWord {
            NotificationCenter.default.post(name: NSNotification.Name("green"), object: nil)
        } else {
            NotificationCenter.default.post(name: NSNotification.Name("red"), object: nil)
        }
    }
    
    func setupFeedLayot(stackView: UIStackView, textField: UITextField, checkGuessButton: UIButton, colorLabel: UILabel){
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(150)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(50)
        }
        
        checkGuessButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(50)
        }
        
        colorLabel.snp.makeConstraints { make in
            make.top.equalTo(checkGuessButton.snp.bottom).offset(20)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(50)
        }
        
        
    }
    
}
          
