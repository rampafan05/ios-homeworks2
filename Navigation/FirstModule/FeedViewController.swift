//
//  FirstTabVC.swift
//  Navigation
//
//  Created by macbook on 01.09.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Post")
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let button1: UIButton = {
        var button1 = UIButton()
        button1 = UIButton()
        button1.setTitle("Button One", for: .normal)
        button1.setTitleColor(UIColor.black, for: .normal)
        button1.backgroundColor = .white
        button1.layer.cornerRadius = 14
        button1.addTarget(nil, action: #selector(showDetailController), for: .touchDown)
        button1.translatesAutoresizingMaskIntoConstraints = false
        
        return button1
    }()
    
    let button2: UIButton = {
        var button2 = UIButton()
        button2 = UIButton()
        button2.setTitle("Button Two", for: .normal)
        button2.setTitleColor(UIColor.black, for: .normal)
        button2.backgroundColor = .systemBlue
        button2.layer.cornerRadius = 14
        button2.addTarget(nil, action: #selector(showDetailController), for: .touchDown)
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        return button2
    }()
    
    
    func constraints() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        constraints()
        title = "First Text"
    }
    
    @objc func showDetailController() {
        let exampleViewController = PostViewController()
        navigationController?.pushViewController(exampleViewController, animated: true)
    }
}
    

