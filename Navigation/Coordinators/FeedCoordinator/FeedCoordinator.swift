//
//  FirstCoordinator.swift
//  Navigation
//
//  Created by macbook on 06.12.2022.
//

import Foundation
import UIKit

final class FeedCoordinator {
    func showDeatils(navCon: UINavigationController?, coordinator: FeedCoordinator) {
//        let viewModel = ViewModel()
//        let vc = MVVMViewController(viewModel: viewModel, coordinator: coordinator)
//        vc.view.backgroundColor = .red
//        vc.title = "First"
//        navCon?.pushViewController(vc, animated: true)
//        navCon?.present(vc, animated: true)
    }
    
    func pop(navCon: UINavigationController?) {
        navCon?.popViewController(animated: true)
    }
}
