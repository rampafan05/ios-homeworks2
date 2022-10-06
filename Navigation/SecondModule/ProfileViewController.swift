//
//  SwiftUIView.swift
//  Navigation
//
//  Created by macbook on 31.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView = ProfileHeaderView()
    
    let newButton: UIButton = {
        let newButton = UIButton()
        newButton.backgroundColor = .systemBlue
        newButton.setTitle("New Button", for: .normal)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        
        return newButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
          headerLayot()
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       view.addSubview(profileHeaderView)
        print(#function)
    }
    
    func headerLayot() {
        view.addSubview(profileHeaderView)
        
    
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
        
        
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    

        
    }
    
    

