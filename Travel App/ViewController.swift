//
//  ViewController.swift
//  Travel App
//
//  Created by Shubhdeep on 2022-11-03.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logInButton: UIButton!

    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        title = "Welcome"
        
        
        logInButton.layer.shadowColor = UIColor.gray.cgColor
        logInButton.layer.shadowOpacity = 1.0
        logInButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        createAccountButton.layer.shadowColor = UIColor.gray.cgColor
        createAccountButton.layer.shadowOpacity = 1.0
        createAccountButton.layer.shadowOffset = CGSize(width: 10, height: 10)
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! LoginViewController
        vc.customTitle = "Log In"
    }

    @IBAction func createAccountTapped(_ sender: Any) {
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

