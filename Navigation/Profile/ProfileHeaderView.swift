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
    
    let  fullNameLabel: UILabel = {
        let labelName = UILabel()
        labelName.text = "Рыжик Пыжик"
        labelName.numberOfLines = 3
        labelName.font = UIFont.boldSystemFont(ofSize: 18)
        labelName.textColor = UIColor.black
        labelName.translatesAutoresizingMaskIntoConstraints = false
        
        return labelName
    }()
    
    let statusLable: UILabel = {
        let labeleWhaiting = UILabel()
        labeleWhaiting.text = "Whaiting for something..."
        labeleWhaiting.textColor = UIColor.gray
        labeleWhaiting.numberOfLines = 3
        labeleWhaiting.font = UIFont.boldSystemFont(ofSize: 15)
        labeleWhaiting.translatesAutoresizingMaskIntoConstraints = false
        
        return labeleWhaiting
    }()
    
    let  avatarImageView: UIImageView = {
        var catFoto = UIImageView()
        let image = UIImage(named: "kot")
        catFoto.contentMode = .scaleAspectFit
        catFoto.tintColor = .lightGray
        catFoto.backgroundColor = .clear
        catFoto.image = image
        catFoto.frame.size.width = 120
        catFoto.frame.size.height = 120
        catFoto.layer.cornerRadius = catFoto.frame.size.width / 2
        catFoto.clipsToBounds = true
        catFoto.layer.borderColor = UIColor.white.cgColor
        catFoto.layer.borderWidth = 6
        catFoto.translatesAutoresizingMaskIntoConstraints = false
        
        return catFoto
    }()
    
    let newButton: UIButton = {
        let newButton = UIButton()
        newButton.backgroundColor = .systemBlue
        newButton.setTitle("New Button", for: .normal)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        
        return newButton
    }()
    
    let  setButtonSetStatus: UIButton = {
        var button = UIButton()
        button = UIButton(type: .roundedRect)
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.backgroundColor = UIColor.systemBlue
        button.layer.shadowRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var statusTextT: String = ""
    
    let statusTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.placeholder = "Статус"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 6
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTarget() {
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        statusTextField.isUserInteractionEnabled = true
    }
    
    func addTapGesture() {
        setButtonSetStatus.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setButtonSetStatus.isUserInteractionEnabled = true
    }
    
    
    func layout() {
        self.addSubview(newButton)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLable)
        self.addSubview(avatarImageView)
        self.addSubview(setButtonSetStatus)
        self.addSubview(statusTextField)
        addTarget()
        addTapGesture()
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -55),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 163),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 120.0),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 150.0)
        ])
        
        NSLayoutConstraint.activate([
            statusLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            statusLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 165),
            statusLable.heightAnchor.constraint(equalToConstant: 100),
            statusLable.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -15),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
        ])
        
        NSLayoutConstraint.activate([
            setButtonSetStatus.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            setButtonSetStatus.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            setButtonSetStatus.heightAnchor.constraint(equalToConstant: 50),
            setButtonSetStatus.widthAnchor.constraint(equalToConstant: 360)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 164),
            statusTextField.heightAnchor.constraint(equalToConstant: 42),
            statusTextField.widthAnchor.constraint(equalToConstant: 209)
        ])
        
        NSLayoutConstraint.activate([
            newButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            newButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            newButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    @objc
    func buttonPressed() {
        print(statusTextT)
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusTextT = textField.text ?? ""
    }
    
}
