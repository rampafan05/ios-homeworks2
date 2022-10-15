//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by macbook on 12.09.2022.
//

import UIKit

class ProfileHeaderView: UIView{
//    static let identifire = "ProfileHeaderView"

    let lableProfile1: UILabel = {
        let lableProfile1 = UILabel()
        lableProfile1.text = "Profile"
        lableProfile1.numberOfLines = 1
        lableProfile1.font = UIFont.boldSystemFont(ofSize: 15)
        lableProfile1.translatesAutoresizingMaskIntoConstraints = false

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
        catFoto.frame.size.width = 130
        catFoto.frame.size.height = 130
        catFoto.layer.cornerRadius = catFoto.frame.size.width / 2
        catFoto.clipsToBounds = true
        catFoto.layer.borderColor = UIColor.white.cgColor
        catFoto.layer.borderWidth = 6
        catFoto.translatesAutoresizingMaskIntoConstraints = false

        return catFoto
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
//        textField.layer.borderWidth = 5
        textField.layer.cornerRadius = 14
        textField.layer.borderWidth = 0.5
        textField.clipsToBounds = true
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
        self.addSubview(fullNameLabel)
        self.addSubview(statusLable)
        self.addSubview(avatarImageView)
        self.addSubview(setButtonSetStatus)
        self.addSubview(statusTextField)
        self.addSubview(lableProfile1)
        addTarget()
        addTapGesture()

        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 163),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 120.0),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 150.0),

            
            statusLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),

            statusLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 165),
            statusLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusLable.heightAnchor.constraint(equalToConstant: 100),
            statusLable.widthAnchor.constraint(equalToConstant: 300),


            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            avatarImageView.widthAnchor.constraint(equalToConstant: 130),


            setButtonSetStatus.topAnchor.constraint(equalTo: self.topAnchor, constant: 170),
            setButtonSetStatus.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setButtonSetStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setButtonSetStatus.heightAnchor.constraint(equalToConstant: 50),
            setButtonSetStatus.widthAnchor.constraint(equalToConstant: 360),


            statusTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 164),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 42),
            statusTextField.widthAnchor.constraint(equalToConstant: 209),


            lableProfile1.topAnchor.constraint(equalTo: self.topAnchor, constant: -50),
            lableProfile1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 180),
            lableProfile1.widthAnchor.constraint(equalToConstant: 100),
            lableProfile1.heightAnchor.constraint(equalToConstant: 100)
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

public extension UIView {

    
    func addSubviews(_ subviews: UIView...) {
          subviews.forEach { addSubview($0) }
      }
}
