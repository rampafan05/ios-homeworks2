//
//  CustomButton.swift
//  Navigation
//
//  Created by macbook on 28.11.2022.
//

import Foundation
import UIKit


final class CustomButton: UIButton {
    //MARK: замыкание, в котором вызывающий объект, контроллер или родительский UIView, определят действие по нажатию кнопки
    var tapAction: (() -> Void)?

    //MARK:  INIT в который передан title titleColor
     init(title: String, titleColor: UIColor = .white, bgColor: UIColor){
         super.init(frame: .zero)
        
         setTitle(title, for: .normal)
         setTitleColor(titleColor, for: .normal)
         layer.cornerRadius = 14
         backgroundColor = bgColor
         addTarget(self, action: #selector(buttonTapped), for: .touchDown)
         translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: замыкание, в котором вызывающий объект, контроллер или родительский UIView, определят действие по нажатию кнопки
    @objc private func buttonTapped() {
        tapAction?()
    }
    
}
