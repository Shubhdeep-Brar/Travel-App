//
//  FriendCell.swift
//  Trip
//
//
//

import Foundation
import UIKit

class FriendCell: UITableViewCell{
    
    lazy var avatarView: UIImageView = {
        let  iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iv.layer.cornerRadius = 30
        return iv
    }()
    
    lazy var nickNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = UIColor (named: "#9F9EA5")
        return label
    }()
    
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = UIColor(named: "#9F9EA5")
        return label
        
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "share"), for: .normal)
        return button
    }()
    
    
    lazy var labelsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(nickNameLabel)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(ageLabel)
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var leftStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.addArrangedSubview(avatarView)
        stackView.addArrangedSubview(labelsStack)
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
        
    
    lazy var contentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.addArrangedSubview(leftStack)
        stackView.addArrangedSubview(shareButton)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setupView()
    }
    func setupView() {
        contentView.addSubview(contentStack)
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    
    func updateView(
        nickName: String,
        age: String,
        location: String,
        image: UIImage?
    ){
        nickNameLabel.text = nickName
        ageLabel.text = age
        locationLabel.text = location
        avatarView.image = image
    }
}
