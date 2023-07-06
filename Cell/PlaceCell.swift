//
//  PlaceCell.swift
//  Travel App
//
//  Created by Shubhdeep on 2023-04-01.
//

import Foundation
import UIKit
import ElementKit

class PlaceCell: UICollectionViewCell {
    
    lazy var imageView = BaseUIImageView()
    
    lazy var nameLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        contentView.addSubview(imageView)
        imageView.frame = contentView.frame
        
        imageView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 20)
        ])
    }
}
