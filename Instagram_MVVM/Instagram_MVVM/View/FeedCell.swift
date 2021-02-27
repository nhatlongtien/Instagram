//
//  FeedCell.swift
//  Instagram_MVVM
//
//  Created by NGUYENLONGTIEN on 2/27/21.
//

import UIKit

class FeedCell: UICollectionViewCell {
    //MARK: - Properties
    private let profileImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.layer.cornerRadius = 20
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Venom", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsernameButton), for: .touchUpInside)
        return button
    }()
    private let postImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    private lazy var likeButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
        button.tintColor = .black
        return button
    }()
    private lazy var commentButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        button.tintColor = .black
        return button
    }()
    private lazy var shareButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send2"), for: .normal)
        button.tintColor = .black
        return button
    }()
    private var stackView:UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    private let likesLabel:UILabel = {
        let label = UILabel()
        label.text = "1 likes"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    private let captionLabel:UILabel = {
        let label = UILabel()
        label.text = "Some text caption for me..."
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    private let postTimeLabel:UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        
        self.addSubview(usernameButton)
        usernameButton.centerY(inView: self
                                .profileImageView, leftAnchor: self.profileImageView.rightAnchor, paddingLeft: 8)
        
        self.addSubview(postImageView)
        postImageView.anchor(top: self.profileImageView.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        
        configureActionButton()
        
        self.addSubview(likesLabel)
        likesLabel.anchor(top:self.stackView.bottomAnchor, left:self.leftAnchor, paddingTop: -4, paddingLeft: 8)
        
        self.addSubview(captionLabel)
        captionLabel.anchor(top: self.likesLabel.bottomAnchor, left: self.leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        self.addSubview(postTimeLabel)
        postTimeLabel.anchor(top: self.captionLabel.bottomAnchor, left: self.leftAnchor, paddingTop: 8, paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Action
    @objc func didTapUsernameButton(){
        print("Debug: dit tap username button")
    }
    //MARK: Helper
    func configureActionButton(){
        stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        stackView.anchor(top: self.postImageView.bottomAnchor, left: self.leftAnchor, paddingTop: 0, paddingLeft: 0, width: 150, height: 50)
    }
}
