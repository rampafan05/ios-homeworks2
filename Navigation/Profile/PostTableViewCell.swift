//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by macbook on 11.10.2022.
//

import UIKit
import StorageService
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    // MARK: Author
    
    private lazy var author: UILabel = {
        
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return author
    }()
    // MARK: Image
    
    
    private lazy var postImage: UIImageView = {
    
        let postImage = UIImageView()
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.backgroundColor = .black
        postImage.contentMode = .scaleAspectFit
        
        return postImage
    }()
    
    // MARK: Description
    
    private lazy var postDescription: UILabel = {

        let postDescription = UILabel()
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        postDescription.font = UIFont.systemFont(ofSize: 14)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        
        return postDescription
    }()
    
    // MARK: Like and View
    private lazy var postLikesCounter = counter()
    private lazy var postViewsCounter = counter()

    private func counter() -> UILabel {

        let counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.font = UIFont.systemFont(ofSize: 16)
        counter.textColor = .black
        return counter
    }
    let filter = ImageProcessor()
    
    
    public func setConfigureOfCell(post: PostProfile) {
        self.author.text = post.author
        self.postDescription.text = post.description
        self.postImage.image = UIImage(named: post.image)
        guard let image = postImage.image else { return }
        
//         Добавим наложение фильтра при помощи зависимости iOSIntPackage:
        filter.processImage(sourceImage: image, filter: .posterize) { filterImage in
            postImage.image = filterImage
        }

        self.postLikesCounter.text = "Likes: \(post.likes)"
        self.postViewsCounter.text = "Views: \(post.views)"
    }
    
    // MARK: Constraints
    private func setupConstraints(){
        contentView.addSubview(postLikesCounter)
        contentView.addSubview(postViewsCounter)
        contentView.addSubview(author)
        contentView.addSubview(postImage)
        contentView.addSubview(postDescription)

        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            author.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            author.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            author.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),


            
            postImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),

            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),

            
            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            postLikesCounter.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postLikesCounter.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikesCounter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            postViewsCounter.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViewsCounter.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViewsCounter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}


