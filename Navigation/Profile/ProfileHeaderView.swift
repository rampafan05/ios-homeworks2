//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by macbook on 12.09.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let lableProfile1: UILabel = {
        let lableProfile1 = UILabel()
        let labelframe = CGRect(x: 173, y: 1, width: 100, height: 100)
        lableProfile1.frame = labelframe
        lableProfile1.text = "Profile"
        lableProfile1.numberOfLines = 1
        lableProfile1.font = UIFont.boldSystemFont(ofSize: 15)
        
        return lableProfile1
    }()
    
    let  labelName: UILabel = {
        let labelName = UILabel()
        let labelframe = CGRect(x: 165, y: 47, width: 200, height: 100)
        labelName.frame = labelframe
        labelName.text = "Рыжик Пыжик"
        labelName.numberOfLines = 3
        labelName.font = UIFont.boldSystemFont(ofSize: 18)
        labelName.textColor = UIColor.black
        
        return labelName
    }()
    
    let labelWhaiting: UILabel = {
        let labeleWhaiting = UILabel()
        let labelframe = CGRect(x: 165, y: 100, width: 300, height: 100)
        labeleWhaiting.frame = labelframe
        labeleWhaiting.text = "Whaiting for something..."
        labeleWhaiting.textColor = UIColor.gray
        labeleWhaiting.numberOfLines = 3
        labeleWhaiting.font = UIFont.boldSystemFont(ofSize: 15)
        
        return labeleWhaiting
    }()
    
    let  catUIImageView: UIImageView = {
        var catFoto = UIImageView()
        let image = UIImage(named: "kot")
        catFoto.contentMode = .scaleAspectFit
        catFoto.frame = CGRect(x: 15.0, y: 70.0, width: 120.0, height: 120.0)
        catFoto.tintColor = .lightGray
        catFoto.backgroundColor = .clear
        catFoto.image = image
        catFoto.layer.cornerRadius = catFoto.bounds.height / 2
        catFoto.clipsToBounds = true
        catFoto.layer.borderColor = UIColor.white.cgColor
        catFoto.layer.borderWidth = 6
        
        return catFoto
    }()
    
    let  buttonSetStatus: UIButton = {
        var button = UIButton()
        button = UIButton(type: .roundedRect)
        let frame = CGRect(x: 15, y: 250, width: 360, height: 50)
        button.frame = frame
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.backgroundColor = UIColor.systemBlue
        button.layer.shadowRadius = 6
        
        return button
    }()
    
    func addTapGesture() {
        buttonSetStatus.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonSetStatus.isUserInteractionEnabled = true
    }
    
    @objc
    func buttonPressed() {
        print(statusTextT)
    }
    
    
    
    
    // ДОПОЛНИТЕЛЬНОЕ ЗАДАНИЕ
    private var statusTextT: String = ""
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 164, y: 180, width: 209, height: 42)
        textField.contentVerticalAlignment = .center
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.placeholder = "Статус"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 6
        
        return textField
    }()
    
    
    func addTarget() {
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        textField.isUserInteractionEnabled = true
    }
    
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusTextT = textField.text ?? ""
    }
}
