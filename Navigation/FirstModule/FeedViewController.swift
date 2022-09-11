//
//  FirstTabVC.swift
//  Navigation
//
//  Created by macbook on 01.09.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        button1()
        lable2()
    }
    
    func lable2(){
        let myLable1 = UILabel()
        let labelframe = CGRect(x: 165, y: 10, width: 100, height: 100)
        myLable1.frame = labelframe
        myLable1.numberOfLines = 3
        myLable1.text = "First text"
        myLable1.font = UIFont.boldSystemFont(ofSize: 15)
        view.addSubview(myLable1)
    }
    
    func button1(){
        var button = UIButton()
        button = UIButton(type: .roundedRect)
        let fr = CGRect(x: 126, y: 680, width: 150, height: 50)
        button.frame = fr
        button.setTitle("Show Alert", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(showDetailController), for: .touchDown)
        self.view.addSubview(button)
        
    }
    
    @objc func showDetailController() {
        let exampleViewController = PostViewController()
        navigationController?.pushViewController(exampleViewController, animated: true)
    }
}
    

