//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by macbook on 23.10.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell{
    
    
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: Title
 private lazy var title: UILabel = {
        
        let title = UILabel()
        title.text = "Photos"
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    // MARK: Arrow
   private lazy var arrow: UIImageView = {
        
        var  arrow = UIImageView()
        let image = UIImage(systemName: "arrow.right")
        arrow.image = image
        arrow.tintColor = .black
        arrow.translatesAutoresizingMaskIntoConstraints = false
        
        return arrow
    }()
    
    // MARK: Image0
  private  lazy var photo_0: UIImageView = {
        
        var  photo_0 = UIImageView()
        let image = UIImage(named: "photo_4")
        photo_0.image = image
        photo_0.layer.cornerRadius = 6
        photo_0.clipsToBounds = true
        
        return photo_0
    }()
    
    // MARK: Image1
   private lazy var photo_1: UIImageView = {
        
        var  photo_1 = UIImageView()
        let image = UIImage(named: "photo_6")
        photo_1.image = image
        photo_1.layer.cornerRadius = 6
        photo_1.clipsToBounds = true

        return photo_1
    }()
    
    // MARK: Image2
    private  lazy var photo_2: UIImageView = {
        
        var  photo_2 = UIImageView()
        let image = UIImage(named: "photo_2")
        photo_2.image = image
        photo_2.layer.cornerRadius = 6
        photo_2.clipsToBounds = true

        
        return photo_2
    }()
    
    // MARK: Image3
    private lazy var photo_3: UIImageView = {
        
        var  photo_3 = UIImageView()
        let image = UIImage(named: "photo_3")
        photo_3.image = image
        photo_3.layer.cornerRadius = 6
        photo_3.clipsToBounds = true

        
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
        contentView.addSubview(stackView)
        self.stackView.addArrangedSubview(photo_0)
        self.stackView.addArrangedSubview(photo_1)
        self.stackView.addArrangedSubview(photo_3)
        self.stackView.addArrangedSubview(photo_2)
        contentView.addSubview(self.arrow)
        contentView.addSubview(self.title)

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
            
            stackView.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            
        ])
    }
    
}
