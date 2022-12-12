//
//  FirstCoordinator.swift
//  Navigation
//
//  Created by macbook on 06.12.2022.
//

import Foundation
import UIKit

final class FeedCoordinator {
    
    func showDeatils(coordinator: FeedCoordinator) -> UIViewController {
        
        let viewModel = FeedModel()
        let vc = FeedViewController(viewModel: viewModel,coordinator: coordinator)
        vc.view.backgroundColor = .lightGray
        vc.title = "First Text"
        return vc
        
    }
}

final class PostViewCoordinator {
    
    func showDeatils(navCon: UINavigationController?, coordinator: PostViewCoordinator){
        
        let vc = PostViewController(coordinator: coordinator)
        vc.view.backgroundColor = .white
        vc.title = "New post"
        navCon?.pushViewController(vc, animated: true)
        
    }
}

final class InfoViewCoordinator {
    
    func showDeatils(navCon: UINavigationController?, coordinator: InfoViewCoordinator){
        
        let vc = InfoView(coordinator: coordinator)
        vc.view.backgroundColor = .red
        navCon?.present(vc, animated: true)
        
    }
}
