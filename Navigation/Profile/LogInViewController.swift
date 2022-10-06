//
//  LogInViewController.swift
//  Navigation
//
//  Created by macbook on 28.09.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()

    private lazy  var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private lazy var iconVK: UIImageView = {
        var iconVK = UIImageView()
        let image = UIImage(named: "VK")
        iconVK.image = image
        iconVK.frame.size.width = 100
        iconVK.frame.size.height = 100
        iconVK.translatesAutoresizingMaskIntoConstraints = false

        return iconVK
    }()

    private lazy var login: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Email of phone"
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.tag = 0
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = UIColor.tintColor
        textField.autocorrectionType = .no
        textField.keyboardType = .phonePad
        textField.clearButtonMode = .whileEditing
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private lazy var password: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.tag = 1
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = UIColor.tintColor
        textField.autocorrectionType = .no
        textField.clipsToBounds = true
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()

    private lazy var buttonLogIn: UIButton = {
        var buttonLogIn = UIButton()
        buttonLogIn.setTitle("Log In", for: .normal)
        buttonLogIn.setTitleColor(UIColor.white, for: .normal)
        buttonLogIn.backgroundColor = .systemBlue
        buttonLogIn.layer.cornerRadius = 14
        buttonLogIn.clipsToBounds = true
        buttonLogIn.backgroundColor = UIColor(red: 70/255.0, green: 128/255.0, blue: 194/255.0, alpha: 1.0)
        buttonLogIn.addTarget(self, action: #selector(profile), for: .touchDown)
        buttonLogIn.translatesAutoresizingMaskIntoConstraints = false

        return buttonLogIn
    }()

    private var login1: String?

    func layotLogin() {
        view.addSubview(iconVK)
        self.setupGestures()
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.login)
        self.stackView.addArrangedSubview(self.password)
        self.stackView.addArrangedSubview(self.buttonLogIn)
       self.stackView.setCustomSpacing(16.0, after: self.password)

        NSLayoutConstraint.activate([

            iconVK.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            iconVK.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 155),
            iconVK.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -155),
            iconVK.widthAnchor.constraint(equalToConstant: 100),
            iconVK.heightAnchor.constraint(equalToConstant: 100),
            
            
            stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 330),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 180),
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        layotLogin()
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            let loginButtonBottomPointY = self.stackView.frame.origin.y + self.buttonLogIn.frame.origin.y + self.buttonLogIn.frame.height
            
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            let yOffset = keyboardOriginY < loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 16
            : 0

            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }

    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }

    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    @objc func profile() {
                let exampleViewController = ProfileViewController()
                navigationController?.pushViewController(exampleViewController, animated: true)
            }

}

