//
//  HomeViewController.swift
//  Travel App
//
//  Created by Shubhdeep on 2023-03-09.
//

import Foundation
import UIKit
import ElementKit

class HomeViewController: UIViewController {
    
    let data = DataProvider.mockPlacesData()
    
    lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    lazy var headerImageView: BaseUIImageView = {
         let iv = BaseUIImageView()
        iv.image = UIImage(named: "home")
        return iv
    }()
    
    lazy var titleLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "Cape Town"
        label.textColor = UIColor.white
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    lazy var descriptionLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "A beautiful place in western Canada"
        label.textColor = UIColor.white
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var startButton: BaseUIButton = {
        let button = BaseUIButton()
        button.setTitle("Start",for: .normal)
        button.backgroundColor = .green
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var descStack: VStack = {
        let stack = VStack()
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descriptionLabel)
        stack.addArrangedSubview(startButton)
        stack.spacing = 16
        return stack
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        title = "Home Screen"
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(headerImageView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImageView.topAnchor.constraint(equalTo: view.topAnchor),
            headerImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3)
        ])
        
        headerImageView.addSubview(descStack)
        NSLayoutConstraint.activate([
            descStack.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor, constant: 20),
            descStack.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -20),
            descStack.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor)
        ])
        
        collectionView.register(PlaceCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlaceCell
        
        cell.imageView.image = data[indexPath.row].image
        cell.nameLabel.text = data[indexPath.row].name
        return cell
        
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        // to have custom reaction when cell is selected.
//    }
//    
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = collectionView.frame.height
        return CGSize(width: 300, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
