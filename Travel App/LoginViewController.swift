//
//  LoginViewController.swift
//  Travel App
//
//  Created by Shubhdeep on 2022-11-14.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailAddress: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var customTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = customTitle
        emailAddress.layer.cornerRadius = 29
        password.layer.cornerRadius = 29
        
    }


}
