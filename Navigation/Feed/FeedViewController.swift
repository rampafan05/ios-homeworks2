//
//  FirstTabVC.swift
//  Navigation
//
//  Created by macbook on 01.09.2022.
//

import UIKit

class FeedViewController: UIViewController{
    
    private let coordinator: FeedCoordinator
    init(
        
        coordinator: FeedCoordinator
    ) {
       
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var feed = FeedModel()
    
    var post = Post(title: "Post")
    
   private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    //MARK: Кастомная кнопка
   private let button1 = CustomButton(title: "Button1", bgColor: UIColor.systemOrange)
    
    //MARK: Кастомная кнопка
   private let button2 = CustomButton(title: "Button2", bgColor: UIColor.systemBlue)
    
    lazy var textField: UITextField = {
        
        var text = UITextField()
        text.backgroundColor = .white
        text.layer.cornerRadius = 14
        text.clipsToBounds = true
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    //MARK: Кастомная кнопка
    
    let checkGuessButton = CustomButton(title: "Check Button", bgColor: UIColor.systemBlue )
    
    private lazy var colorLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func constraints() {
        view.addSubview(colorLabel)
        view.addSubview(checkGuessButton)
        view.addSubview(textField)
        view.addSubview(stackView)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 150),
            
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            checkGuessButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            checkGuessButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            checkGuessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            
            colorLabel.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 20),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            colorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            colorLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    //MARK: функция, которая выводит текст
    func tapTextFeild() {
        print(feed.check(word: textField.text!) )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        constraints()
        title = "First Text"
        
        //MARK: tapAction
        checkGuessButton.tapAction = {[weak self] in
            guard let self = self else { return }
            self.tapTextFeild()
        }
        
        button1.tapAction = { [weak self] in
            guard let self = self else { return }
            self.showDetailController()
        }
        
        button2.tapAction = { [weak self] in
            guard let self = self else { return }
            self.showDetailController()
        }
        
        //MARK: TASK 6. PART 2. Natification Default Add Observer
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(codeRed),
            name: NSNotification.Name("red"),
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(codeGreen),
            name: NSNotification.Name("green"),
            object: nil)
    }
    
    
    @objc func codeRed() {
        colorLabel.text = "RED"
        colorLabel.textColor = .red
    }
    
    @objc func codeGreen() {
        colorLabel.text = "GREEN"
        colorLabel.textColor = .green
    }
    
    @objc func showDetailController() {
        let exampleViewController = PostViewController()
        navigationController?.pushViewController(exampleViewController, animated: true)
    }
    
    
}


