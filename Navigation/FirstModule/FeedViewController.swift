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
    
    func lable2(){
        let myLable1 = UILabel()
        let labelframe = CGRect(x: 165, y: 10, width: 100, height: 100)
        myLable1.frame = labelframe
        myLable1.numberOfLines = 3
        myLable1.text = "First text"
        myLable1.font = UIFont.boldSystemFont(ofSize: 15)
        view.addSubview(myLable1)
    }
    
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
        lable2()
        constraints()
    }
    
    @objc func showDetailController() {
        let exampleViewController = PostViewController()
        navigationController?.pushViewController(exampleViewController, animated: true)
    }
}
    

