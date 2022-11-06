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
        catFoto.isUserInteractionEnabled = true
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
    // MARK: CROSS
    lazy var crossImage: UIImageView = {
        
        var  cross = UIImageView()
        let image = UIImage(systemName: "xmark.circle")
        cross.image = image
        cross.tintColor = .black
        cross.isHidden = true
        cross.translatesAutoresizingMaskIntoConstraints = false
        
        return cross
    }()
    //MARK: Button Avatar
    private lazy var crossButton: UIButton = {
        
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.isHidden = true
        button.addTarget(self, action: #selector(self.closeTapAnimationButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var transparentView: UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 65
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var animationAvatarButton: UIButton = {
        
        let button = UIButton()
        button.layer.cornerRadius = 65
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.didTapAnimationButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
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
        contentView.addSubviews(fullNameLabel,setButtonSetStatus,statusTextField,statusLable,transparentView,crossImage,crossButton,avatarImageView,animationAvatarButton)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Закрытие аватара
    private func closeAvatar(completion: @escaping () -> Void) {
        
        let startPoint = self.avatarImageView.center
        
        UIView.animate(withDuration: 0.3, delay: 0.0) {
            self.avatarImageView.clipsToBounds = true
        } completion: { _ in
            //MARK: Доп. задание
            UIView.animate(withDuration: 0.2, delay: 0.0) {
                self.avatarImageView.layer.borderWidth = 5
            } completion: { _ in
                UIView.animate(withDuration: 0.3, delay: 0.0) {
                    self.avatarImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                } completion: { _ in
                    UIView.animate(withDuration: 0.3, delay: 0.0) {
                        self.avatarImageView.center = CGPoint(x: startPoint.x - 126, y: startPoint.y - 170)
                    }
                }
            }
        }
    }
    
    
    //MARK: Закрытие прозрачное View
    private func closeTransparent(completion: @escaping () -> Void) {
        
        let startPoint = self.transparentView.center
        
        UIView.animate(withDuration: 0.3, delay: 0.0) {
            self.transparentView.alpha = 0.0
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0) {
                self.transparentView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            } completion: { _ in
                UIView.animate(withDuration: 0.3, delay: 0.0) {
                    self.transparentView.center = CGPoint(x: startPoint.x - 126, y: startPoint.y - 170)
                }
            }
        }
    }
    
    //MARK: Закрытие кнопки - крестик
    private func closeCrossAnimation(completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: 0.1, delay: 0.0) {
            self.crossButton.alpha = 0
        } completion: { _ in
            self.crossButton.isHidden = true
            self.crossImage.isHidden = true
            completion()
            
        }
    }
    
    //MARK: Анимация открытия прозрачной View
    private func transparentViewAnimation(completion: @escaping () -> Void) {
        
        let startPoint = self.avatarImageView.center
        
        UIView.animate(withDuration: 0.5, delay: 0.0) {
            self.transparentView.center = CGPoint(x: startPoint.x + 126, y: startPoint.y + 170)
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.transparentView.transform = CGAffineTransform(scaleX: 50.0, y: 50.0)
            } completion: { _ in
                UIView.animate(withDuration: 0.5, delay: 0.0) {
                    self.transparentView.alpha = 0.9
                    completion()
                }
            }
        }
        
    }
    //MARK: Анимация открытия аватара
    private func avatarAnimation(completion: @escaping () -> Void) {
        
        let startPoint = self.avatarImageView.center
        
        UIView.animate(withDuration: 0.5, delay: 0.0) {
            self.avatarImageView.center = CGPoint(x: startPoint.x + 126, y: startPoint.y + 170)
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.avatarImageView.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            }completion: { _ in
                //MARK: Доп. задание
                UIView.animate(withDuration: 0.4, delay: 0.0) {
                    self.avatarImageView.layer.borderWidth = 0
                }completion: { _ in
                    UIView.animate(withDuration: 0.5, delay: 0.0) {
                        self.avatarImageView.clipsToBounds = false
                        completion()
                    }
                    
                }
            }
        }
    }
    //MARK: Анимация открытия кнопки-крестик
    private func crossAnimation(completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: 1.5, delay: 0.0) {
            self.crossButton.alpha = 2
        } completion: { _ in
            self.crossButton.isHidden = false
            self.crossImage.isHidden = false
            completion()
            
        }
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
            
            crossButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
            crossButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            crossButton.heightAnchor.constraint(equalToConstant: 50),
            crossButton.widthAnchor.constraint(equalToConstant: 50),
            
            crossImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
            crossImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            crossImage.heightAnchor.constraint(equalToConstant: 40),
            crossImage.widthAnchor.constraint(equalToConstant: 40),


            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            avatarImageView.widthAnchor.constraint(equalToConstant: 130),
            
            transparentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            transparentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            transparentView.heightAnchor.constraint(equalToConstant: 130),
            transparentView.widthAnchor.constraint(equalToConstant: 130),
            
            
            animationAvatarButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            animationAvatarButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            animationAvatarButton.heightAnchor.constraint(equalToConstant: 130),
            animationAvatarButton.widthAnchor.constraint(equalToConstant: 130),


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
    
    
    @objc private func didTapAnimationButton() {
        
        self.animationAvatarButton.isEnabled = false
        
        let completion: () -> Void = { [weak self] in
            self?.animationAvatarButton.isEnabled = true
        }
        
        self.transparentViewAnimation(completion: completion)
        self.crossAnimation(completion: completion)
        self.avatarAnimation(completion: completion)
        
    }
    
    
    @objc private func closeTapAnimationButton() {
        
        self.crossButton.isEnabled = false

        let completion: () -> Void = { [weak self] in
            self?.crossButton.isEnabled = true
        }

        self.closeAvatar(completion: completion)
        self.closeTransparent (completion: completion)
        self.closeCrossAnimation (completion: completion)
        
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
