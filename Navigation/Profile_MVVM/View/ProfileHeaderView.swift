//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by macbook on 12.09.2022.
//

import UIKit
import SnapKit
class ProfileHeaderView: UITableViewHeaderFooterView, UITableViewDelegate{
    
     var centerAvatar = CGPoint()
    
    lazy var fullNameLabel: UILabel = {
        
        let labelName = UILabel()
        labelName.text = ""
        labelName.numberOfLines = 3
        labelName.font = UIFont.boldSystemFont(ofSize: 18)
        labelName.textColor = UIColor.black
        labelName.translatesAutoresizingMaskIntoConstraints = false
        
        return labelName
    }()
    
    lazy var statusLable: UILabel = {
        
        let labeleWhaiting = UILabel()
        labeleWhaiting.text = "Whaiting for something..."
        labeleWhaiting.textColor = UIColor.gray
        labeleWhaiting.numberOfLines = 3
        labeleWhaiting.font = UIFont.boldSystemFont(ofSize: 15)
        labeleWhaiting.translatesAutoresizingMaskIntoConstraints = false
        
        return labeleWhaiting
    }()
    
    lazy var imageGestur = UITapGestureRecognizer(target: self, action: #selector(tapToAvatar))
    
    lazy var avatarImageView: UIImageView = {
        
        var catFoto = UIImageView()
        let image = UIImage(named: "kot")
        catFoto.tintColor = .lightGray
        catFoto.backgroundColor = .clear
        catFoto.image = image
        catFoto.addGestureRecognizer(imageGestur)
        catFoto.layer.cornerRadius = 65
        catFoto.clipsToBounds = true
        catFoto.isUserInteractionEnabled = true
        catFoto.layer.borderColor = UIColor.white.cgColor
        catFoto.layer.borderWidth = 5
        catFoto.translatesAutoresizingMaskIntoConstraints = false
        
        return catFoto
    }()
    
    lazy var setButtonSetStatus: UIButton = {
        //MARK: Заменил обычный UIButton на кастомный
        
        var button = UIButton(type: .roundedRect)
        button.setTitle("Button", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 14
        button.backgroundColor = .systemBlue
        button.layer.shadowRadius = 6
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        
        return button
    }()
    
    lazy var crossGestur = UITapGestureRecognizer(target: self, action: #selector(self.closeButtonTapped))
    
    // MARK: CROSS
    lazy var crossImage: UIImageView = {
        
        var  cross = UIImageView()
        let image = UIImage(systemName: "xmark.circle")
        cross.image = image
        cross.addGestureRecognizer(crossGestur)
        cross.tintColor = .black
        cross.isUserInteractionEnabled = true
        cross.isHidden = true
        cross.translatesAutoresizingMaskIntoConstraints = false
        
        return cross
    }()
    
    private lazy var transparentView: UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 65
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var statusTextT: String = ""
    
    lazy var statusTextField: UITextField = {
        
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.placeholder = "Status"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 14
        textField.layer.borderWidth = 1
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        textField.isUserInteractionEnabled = true
        
        return textField
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
    //MARK: SnapKit верстка
    
    func addSubViews() -> Void {
        
        self.addSubview(self.fullNameLabel)
        self.addSubview(self.setButtonSetStatus)
        self.addSubview(self.statusTextField)
        self.addSubview(self.statusLable)
        self.addSubview(self.transparentView)
        self.addSubview(self.crossImage)
        self.addSubview(self.avatarImageView)
        
        
        
        self.fullNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.avatarImageView.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(35)
            make.height.equalTo(50)
            make.width.equalTo(180)
        }
        
        self.statusLable.snp.makeConstraints { (make) in
            make.leading.equalTo(self.avatarImageView.snp.trailing).offset(16)
            make.top.equalTo(self.statusTextField.snp.top).offset(-65)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(100)
            make.width.equalTo(300)
        }
        
        self.avatarImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(130)
            make.width.equalTo(130)
        }
        
        self.transparentView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(130)
            make.width.equalTo(130)
        }
        
        self.crossImage.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-25)
            make.top.equalToSuperview().offset(1)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        
        self.setButtonSetStatus.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(170)
            make.height.equalTo(50)
            make.width.equalTo(360)
        }
        
        self.statusTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(self.avatarImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(120)
            make.height.equalTo(42)
            make.width.equalTo(209)
        }
    }
    
    @objc private func tapToAvatar(){
        centerAvatar = avatarImageView.center
        
        UIView.animateKeyframes(withDuration: 0.5, delay: 0) {
            
            self.transparentView.isHidden = false
            self.transparentView.transform = CGAffineTransform(scaleX: 50.0, y: 50.0)
            self.transparentView.alpha = 0.9
            self.avatarImageView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - self.centerAvatar.y)
            self.avatarImageView.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.layer.borderWidth = 0
            self.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0, animations: {
                self.crossImage.alpha = 1
                self.crossImage.isHidden = false
                self.layoutIfNeeded()
            })
        }
        layoutIfNeeded()
    }
    
    @objc private func closeButtonTapped() {
        
        
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, animations: {
            
            self.transparentView.isHidden = true
            self.avatarImageView.clipsToBounds = true
            self.avatarImageView.layer.borderWidth = 5
            self.avatarImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.avatarImageView.layer.cornerRadius = 65
            self.avatarImageView.center = self.centerAvatar
            self.crossImage.alpha = 0
            self.crossImage.isHidden = true
        })
    }
    
    @objc
    func buttonPressed() {
        print(statusTextT)
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusTextT = textField.text ?? ""
    }
    
}

public extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
