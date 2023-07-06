//
//  AppRouter.swift
//  Travel App
//
//  Created by Shubhdeep on 2023-03-09.
//

import Foundation
import UIKit

class AppRouter {
    
    static func navigate(to vc: UIViewController) {
     
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            let nc = UINavigationController(rootViewController: vc)
            sceneDelegate.window?.rootViewController = nc
        }
    }
}
