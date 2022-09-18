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
        view.addSubview(profileHeaderView.labelName)
        view.addSubview(profileHeaderView.lableProfile1)
        view.addSubview(profileHeaderView.catUIImageView)
        view.addSubview(profileHeaderView.labelWhaiting)
        
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        profileHeaderView.frame = CGRect(x: 0, y: 70, width: 400, height: 689)
        view.addSubview(profileHeaderView.textField)
        view.addSubview(profileHeaderView.buttonSetStatus)
        profileHeaderView.addTapGesture()
        profileHeaderView.addTarget()
        
        print(#function)
    }
    
}
