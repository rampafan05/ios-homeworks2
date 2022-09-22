//
//  SwiftUIView.swift
//  Navigation
//
//  Created by macbook on 31.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView = ProfileHeaderView()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
headerLayot()
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       view.addSubview(profileHeaderView)
        view.addSubview(profileHeaderView.lableProfile1)
//        profileHeaderView.frame = CGRect(x: 0, y: 70, width: 400, height: 689)
//        view.addSubview(profileHeaderView.statusTextField)
//        view.addSubview(profileHeaderView.setButtonSetStatus)
//        profileHeaderView.addTapGesture()
//        profileHeaderView.addTarget()
//      profileHeaderView.layout()
//
       
        print(#function)
    }
    
    func headerLayot() {
        view.addSubview(profileHeaderView)
        
    
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    

        
    }
    
    

