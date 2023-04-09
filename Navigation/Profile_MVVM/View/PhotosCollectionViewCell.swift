//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by macbook on 25.10.2022.
//

import UIKit
import iOSIntPackage

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: Image
    private lazy var imagePhotosCell: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
//    private var filterImage = ImageProcessor()
    
//    public func setConfigureOfCell(photos: Photos) {
//
//        self.imagePhotosCell.image = UIImage(named: photos.image)
////
//    }
     
    public func setConfigureOfCell(photos: UIImage) {

        self.imagePhotosCell.image = photos
        
    }
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layuot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layuot() {
        
        contentView.addSubview(imagePhotosCell)
        
        NSLayoutConstraint.activate([
            
            imagePhotosCell.topAnchor.constraint(equalTo: self.topAnchor),
            imagePhotosCell.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imagePhotosCell.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imagePhotosCell.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
        ])
    }
}
