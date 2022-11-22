//
//  SwiftUIView.swift
//  Navigation
//
//  Created by macbook on 31.08.2022.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {

    private var userService: UserService?
    private var login: String
    
    init (userService: UserService, login: String) {
        self.userService = userService
        self.login = login
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private lazy var tableView: UITableView = {
        
        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier:"PostTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier:"PhotosCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        return tableView
    }()
    
    private lazy var layuot: UICollectionViewFlowLayout = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        
        return layout
    }()
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        headerLayot()
        title = "Profile"
        // MARK: NAVIGATION BAR
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print(#function)
    }
    
    func headerLayot() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    
}
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return  2
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        if section == 1{
            return posts.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            let cell0 = tableView.dequeueReusableCell(withIdentifier: "PhotosCell", for: indexPath) as! PhotosTableViewCell
            
            return cell0
        }
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell1.setConfigureOfCell(post: posts[indexPath.row])
        
        return cell1
    }
    
    
    
    
    
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // MARK: Переход на Альбом
        let exampleViewController =  PhotosViewController()
        // MARK: NAVIGATION BAR
        navigationController?.pushViewController(exampleViewController, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as! ProfileHeaderView
            // MARK: передача информации в header
            let currentUser = userService?.userService(login: login )
            headerView.fullNameLabel.text = currentUser?.fullName
            headerView.avatarImageView.image = currentUser?.avatar
            headerView.statusLable.text = currentUser?.status
            
#if DEBUG
headerView.contentView.backgroundColor = .systemGray6
#else
headerView.contentView.backgroundColor = .white
#endif
            
           return headerView
        } else { return nil }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 230
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }
        return UITableView.automaticDimension
    }
}

