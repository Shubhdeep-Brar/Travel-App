//
//  SignUpViewController.swift
//  Travel App
//
//  Created by Shubhdeep on 2022-11-30.
//

import UIKit

class SignUpViewController : UIViewController {
    
    
    lazy var logoImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "loginViewLogo")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Karen Trip"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var usernameTF: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.shadowColor = UIColor.lightGray.cgColor
        tf.layer.cornerRadius = 25
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return tf
    }()
    
    lazy var emailTF: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.shadowColor = UIColor.lightGray.cgColor
        tf.layer.cornerRadius = 25
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return tf
    }()
    
    lazy var passTF: UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.shadowColor = UIColor.lightGray.cgColor
        tf.layer.cornerRadius = 25
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return tf
    }()
    
    lazy var signUpButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = UIColor.green
        button.layer.shadowOpacity = 1
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(signUpHandler), for: .touchUpInside)

        return(button)
    }()
    
    lazy var textFieldsStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.addArrangedSubview(usernameTF)
        stackView.addArrangedSubview(passTF)
        stackView.addArrangedSubview(emailTF)
        stackView.spacing = 20
        stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return stackView
    }()
    
    lazy var contentStack: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.addArrangedSubview(logoImage)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textFieldsStackView)
        stackView.addArrangedSubview(signUpButton)
        stackView.spacing = 50
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        view.addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc
    func signUpHandler() {
        print("Handler Called")
        let vc = TabBarViewController()
        AppRouter.navigate(to: vc)
    }
}
