//
//  ExampleViewController.swift
//  Navigation
//
//  Created by macbook on 31.08.2022.
//

import UIKit

class PostViewController: UIViewController {

    private let coordinator: PostViewCoordinator?
    
    init(coordinator: PostViewCoordinator){
        
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    // срабатывает после загрузки вью
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
//        view.backgroundColor = .white
        lable1()
        burbiten()
        // Do any additional setup after loading the view.
    }
    
    
    func lable1(){
        let myLable = UILabel()
        let labelframe = CGRect(x: 180, y: 10, width: 100, height: 100)
        myLable.frame = labelframe
        myLable.numberOfLines = 3
        myLable.text = "111"
        myLable.font = UIFont.boldSystemFont(ofSize: 15)
        view.addSubview(myLable)
    }
    
    func burbiten(){
        let myButton = UIBarButtonItem(image: UIImage(systemName: "folder.circle.fill"), style: .done, target: self, action: #selector(infoView))
        myButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = myButton
    }
    
    
    @objc func infoView() {
            let coordinator = InfoViewCoordinator()
        coordinator.showDeatils(navCon: navigationController, coordinator: coordinator)
    
        }

 
}
