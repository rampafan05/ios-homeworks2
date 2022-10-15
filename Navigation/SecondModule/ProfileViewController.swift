//
//  SwiftUIView.swift
//  Navigation
//
//  Created by macbook on 31.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView = ProfileHeaderView()
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier:"PostTableViewCell")
        tableView.rowHeight = 600
        
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        headerLayot()
        print(#function)
    }
    //
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print(#function)
    }
    
    func headerLayot() {
        view.addSubview(profileHeaderView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:280),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
                cell.setConfigureOfCell(post: posts[indexPath.row])
        return cell
        
        
    }
    
}

//extension ProfileViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifire) as! ProfileHeaderView
//            return headerView
//        } else { return nil }
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 220
//    }
//}
