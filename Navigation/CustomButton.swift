//
//  CustomButton.swift
//  Navigation
//
//  Created by macbook on 28.11.2022.
//

import Foundation
import UIKit


class CustomButton: UIButton {
    //MARK: замыкание, в котором вызывающий объект, контроллер или родительский UIView, определят действие по нажатию кнопки
    var tapAction: (() -> Void)?

    //MARK:  INIT в который передан title titleColor
    override init(frame: CGRect){
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
    
        setTitle("Button", for: .normal)
        setTitleColor(.black, for: .normal)
        backgroundColor = .systemBlue
        layer.cornerRadius = 14
        addTarget(self, action: #selector(buttonTapped), for: .touchDown)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    //MARK: замыкание, в котором вызывающий объект, контроллер или родительский UIView, определят действие по нажатию кнопки
    
    @objc private func buttonTapped() {
        tapAction?()
    }
    
}
