//
//  InfoView.swift
//  Navigation
//
//  Created by macbook on 09.09.2022.
//

import UIKit


class InfoView: UIViewController {
    
    override func loadView() {
        super.loadView()
        print(#function)
        
    }
    // срабатывает каждый раз при заходе на экран
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        button2()
        view.backgroundColor = .white
    }
    
    
    func button2(){
        var button = UIButton()
        button = UIButton(type: .roundedRect)
        let fr = CGRect(x: 126, y: 680, width: 150, height: 50)
        button.frame = fr
        button.setTitle("Нажми", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(addtarget), for: .touchDown)
        self.view.addSubview(button)
        
    }
    
    
    @objc func addtarget(){
        let alert = UIAlertController(title: "Внимание", message: "Вы точно этого хотите?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Да", style: .default, handler: nil)
        alert.addAction(ok)
        let no = UIAlertAction(title: "Нет", style: .destructive, handler: nil)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
        
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
