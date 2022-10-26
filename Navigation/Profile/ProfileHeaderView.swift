//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by macbook on 12.09.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView, UITableViewDelegate{


    lazy var fullNameLabel: UILabel = {
        
        let labelName = UILabel()
        labelName.text = "Рыжик Пыжик"
        labelName.numberOfLines = 3
        labelName.font = UIFont.boldSystemFont(ofSize: 18)
        labelName.textColor = UIColor.black
        labelName.translatesAutoresizingMaskIntoConstraints = false

        return labelName
    }()

    lazy var statusLable: UILabel = {
        
        let labeleWhaiting = UILabel()
        labeleWhaiting.text = "Whaiting for something..."
        labeleWhaiting.textColor = UIColor.gray
        labeleWhaiting.numberOfLines = 3
        labeleWhaiting.font = UIFont.boldSystemFont(ofSize: 15)
        labeleWhaiting.translatesAutoresizingMaskIntoConstraints = false

        return labeleWhaiting
    }()

    lazy var avatarImageView: UIImageView = {
        
        var catFoto = UIImageView()
        let image = UIImage(named: "kot")
        catFoto.tintColor = .lightGray
        catFoto.backgroundColor = .clear
        catFoto.image = image
        catFoto.layer.cornerRadius = 65
        catFoto.clipsToBounds = true
        catFoto.layer.borderColor = UIColor.white.cgColor
        catFoto.layer.borderWidth = 5
        catFoto.translatesAutoresizingMaskIntoConstraints = false

        return catFoto
    }()



    lazy var setButtonSetStatus: UIButton = {
        
        var button = UIButton()
        button = UIButton(type: .roundedRect)
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.backgroundColor = UIColor.systemBlue
        button.layer.shadowRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        
        return button
    }()

    private var statusTextT: String = ""

    lazy var statusTextField: UITextField = {
        
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.placeholder = "Status"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 14
        textField.layer.borderWidth = 1
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        textField.isUserInteractionEnabled = true
        
        return textField
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(fullNameLabel,avatarImageView,setButtonSetStatus,statusTextField,statusLable)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func layout() {

        NSLayoutConstraint.activate([
            
           
            
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 35),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 50),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 150.0),


            statusLable.topAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -65),

            statusLable.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
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
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 42),
            statusTextField.widthAnchor.constraint(equalToConstant: 209),

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
