//
//  TabBarViewController.swift
//  Travel App
//
//  Created by Shubhdeep on 2023-03-09.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "HomeIcon"), tag: 0)
        
        let friendsVC = FriendsViewController()
        friendsVC.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(named: "friends"), tag: 1)
        
        tabBar.backgroundColor = UIColor.white
        
        viewControllers = [friendsVC, homeVC]
    }
 
}
// to be customized
