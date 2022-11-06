//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by macbook on 23.10.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell{
    
    // MARK: Title
    lazy var title: UILabel = {
        
        let title = UILabel()
        title.text = "Photos"
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    // MARK: Arrow
    lazy var arrow: UIImageView = {
        
        var  arrow = UIImageView()
        let image = UIImage(systemName: "arrow.right")
        arrow.image = image
        arrow.tintColor = .black
        arrow.translatesAutoresizingMaskIntoConstraints = false
        
        return arrow
    }()
    
    // MARK: Image0
    lazy var photo_0: UIImageView = {
        
        var  photo_0 = UIImageView()
        let image = UIImage(named: "photo_0")
        photo_0.image = image
        photo_0.layer.cornerRadius = 6
        photo_0.clipsToBounds = true
        photo_0.translatesAutoresizingMaskIntoConstraints = false
        
        return photo_0
    }()
    
    // MARK: Image1
    lazy var photo_1: UIImageView = {
        
        var  photo_1 = UIImageView()
        let image = UIImage(named: "photo_0-1")
        photo_1.image = image
        photo_1.layer.cornerRadius = 6
        photo_1.clipsToBounds = true
        photo_1.translatesAutoresizingMaskIntoConstraints = false
        
        return photo_1
    }()
    
    // MARK: Image2
    lazy var photo_2: UIImageView = {
        
        var  photo_2 = UIImageView()
        let image = UIImage(named: "photo_0-2")
        photo_2.image = image
        photo_2.layer.cornerRadius = 6
        photo_2.clipsToBounds = true
        photo_2.translatesAutoresizingMaskIntoConstraints = false
        
        return photo_2
    }()
    
    // MARK: Image3
    lazy var photo_3: UIImageView = {
        
        var  photo_3 = UIImageView()
        let image = UIImage(named: "photo_0-3")
        photo_3.image = image
        photo_3.layer.cornerRadius = 6
        photo_3.clipsToBounds = true
        photo_3.translatesAutoresizingMaskIntoConstraints = false
        
        return photo_3
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutPhotos()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func layoutPhotos() {
        
        contentView.addSubview(self.arrow)
        contentView.addSubview(self.title)
        contentView.addSubview(self.photo_0)
        contentView.addSubview(self.photo_1)
        contentView.addSubview(self.photo_2)
        contentView.addSubview(self.photo_3)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            title.widthAnchor.constraint(equalToConstant: 100),
            title.heightAnchor.constraint(equalToConstant: 30),
            
            
            arrow.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            arrow.centerYAnchor.constraint(equalTo: self.title.centerYAnchor),
            arrow.widthAnchor.constraint(equalToConstant: 30),
            arrow.heightAnchor.constraint(equalToConstant: 30),
            arrow.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            
            photo_0.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 12),
            photo_0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            photo_0.heightAnchor.constraint(equalToConstant: 100),
            photo_0.widthAnchor.constraint(equalToConstant: 93),
            photo_0.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            
            
            photo_1.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 12),
            photo_1.leftAnchor.constraint(equalTo: self.photo_0.rightAnchor, constant: 8),
            photo_1.heightAnchor.constraint(equalToConstant: 100),
            photo_1.widthAnchor.constraint(equalToConstant: 93),
            photo_1.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            
            
            photo_2.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 12),
            photo_2.leftAnchor.constraint(equalTo: self.photo_1.rightAnchor, constant: 8),
            photo_2.rightAnchor.constraint(equalTo: self.photo_3.leftAnchor, constant: -8),
            photo_2.heightAnchor.constraint(equalToConstant: 100),
            photo_2.widthAnchor.constraint(equalToConstant: 93),
            photo_2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            
            
            photo_3.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 12),
            photo_3.leftAnchor.constraint(equalTo: self.photo_2.rightAnchor, constant: 8),
            photo_3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            photo_3.heightAnchor.constraint(equalToConstant: 100),
            photo_3.widthAnchor.constraint(equalToConstant: 93),
            photo_3.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            
        ])
    }
    
}
