//
//  FeedViewModel.swift
//  Navigation
//
//  Created by macbook on 13.12.2022.
//

import Foundation
import UIKit

final class FeedViewModel {
    
    var feedModel: FeedModel?
    
    init(feedModel: FeedModel) {
        self.feedModel = feedModel
    }
    
    func setupFeedLayot(stackView: UIStackView, textField: UITextField, checkGuessButton: UIButton, colorLabel: UILabel){
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(150)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(50)
        }
        
        checkGuessButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(50)
        }
        
        colorLabel.snp.makeConstraints { make in
            make.top.equalTo(checkGuessButton.snp.bottom).offset(20)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(50)
        }
        
    }
    
}
