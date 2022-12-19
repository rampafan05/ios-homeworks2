//
//  PhotosViewController.swift
//  Navigation
//
//  Created by macbook on 24.10.2022.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
 
    //MARK: Экземпляр класса ImagePublisherFacade()
var  imagePublisherFacade =  ImagePublisherFacade()
 //MARK: Создал экземпляр класса UIIMAGE
    var newPhotos = [UIImage]()
  
   private var imageProcessor = ImageProcessor()
    
    
    private enum Constant {
        static let numberOfItemsInLine: CGFloat = 3
    }
    
    private lazy var layuot: UICollectionViewFlowLayout = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layuot)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
      
       //MARK: вызов метода processImagesOnThread
        imageProcessor.processImagesOnThread(sourceImages: arrayImages, filter: .fade, qos: QualityOfService.userInitiated) { cgImages in
            
            self.newPhotos =  cgImages.map({UIImage(cgImage: $0!)})
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
           
                
            }
        //MARK: НЕ МОГУ ПОНЯТЬ КАК ВОСПОЛЬЗОВАТЬСЯ ЭТИМ МЕТОДОМ
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] timer in
          
        }
        
      
    
        
        //MARK: Подписка на изменения
//        imagePublisherFacade.subscribe(self)
//        imagePublisherFacade.addImagesWithTimer(time: 0.5, repeat: 15)
        
        self.setup()
    }
    //MARK: Отмена подписки методом deinit
//    deinit {
//
//        imagePublisherFacade.removeSubscription(for: self)
//        imagePublisherFacade.rechargeImageLibrary()
//
//    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        self.collectionView.collectionViewLayout.invalidateLayout()
        
    }
    
    private func setupNavigationBar() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Collection"
        
    }
    
    private func setup() {
        
        self.view.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
        
    }
    
}

extension PhotosViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    // MARK: метод протокола ImageLibrarySubscriber
//    func receive(images: [UIImage]) {
//        newPhotos = images
//       collectionView.reloadData()
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return newPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        
        //MARK: Добавление фото в ячейки коллекции
        cell.setConfigureOfCell(photos: newPhotos[indexPath.item])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let insert = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        
        let interItemSpacing = ( collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        
        let width = collectionView.frame.width - (Constant.numberOfItemsInLine - 1) * interItemSpacing - insert.left - insert.right - insert.top - insert.bottom
        let itemWidth = floor(width / Constant.numberOfItemsInLine)
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
}

