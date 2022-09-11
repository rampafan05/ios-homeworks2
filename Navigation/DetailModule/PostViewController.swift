//
//  ExampleViewController.swift
//  Navigation
//
//  Created by macbook on 31.08.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    // Загрузка вью
    override func loadView() {
        super.loadView()
        print(#function)
        
    }
    
    // срабатывает каждый раз при заходе на экран
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(#function)
    }
    
    // срабатывает каждый раз после загрузки вью
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(#function)
        
    }
    

    // срабатывает после загрузки вью
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        view.backgroundColor = .white
        lable1()
        burbiten()
        // Do any additional setup after loading the view.
    }
    
    let post1 = FeedViewController().post.title
    
    func lable1(){
        let myLable = UILabel()
        let labelframe = CGRect(x: 180, y: 10, width: 100, height: 100)
        myLable.frame = labelframe
        myLable.numberOfLines = 3
        myLable.text = post1
        myLable.font = UIFont.boldSystemFont(ofSize: 15)
        view.addSubview(myLable)
    }
    
    func burbiten(){
        let myButton = UIBarButtonItem(image: UIImage(systemName: "folder.circle.fill"), style: .done, target: self, action: #selector(infoView))
        myButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = myButton
    }
    
    
    @objc func infoView() {
            let infoView = InfoView()
        present(infoView, animated: true)
    
        }

    // срабатывает перед тем как контроллер закроется
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    // срабатывает после того как контроллер закроется
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    // срабатывает при развороте жкрана
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }
    
    // при удалении контроллера из памяти
    deinit {
        print(#function)
    }

}
