//
//  TestNetworkingViewController.swift
//  Travel App
//
//  Created by Shubhdeep on 2023-02-09.
//

import Foundation
//import ElementKit
import UIKit

class TestNetworkingViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRectMake(100, 100, 100, 50))
        button.setTitle("Test Networking", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(testNetworkingFunctionality), for: .touchUpInside)
        button.layer.cornerRadius = 30
        
        
        view.backgroundColor = .lightGray
        title = "Test"
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 180),
        ])
    }
    @objc func testNetworkingFunctionality(){
        // TODO: DO Networking Flow here
       //1 let jsonData = Serializer.rawUserJSon()
//        if let user = Serializer.deserializer(jsonString: jsonData) {
//            print("The first name for the user is \(user.firstName)")
//        } else{
//            print("user does not exist")
//        }
        
        //2
//
//        let jsonData = Serializer.rawUserArrayJSon()
//        let users = Serializer.deserializer(jsonString: jsonData)
//        print("Length of array is \(users.count)")
//
//        for user in users{
//            print("user first name is \(user.firstName)")
//        }
        
        //3 Using Serializer to convert ther data into json
        
//        let user1 = UserDM(firstName: "Shubhdeep", lastName: "Brar", country: "Canada")
//        if let json = Serializer.serialize(user: user1){
//            print("json data is ")
//            print(json)
//        }
        
        //4
        //Networking.makeMockApi()
        
        //5
        ModernNetworking.mockApi3 { data in
            // do your logic here with the recieved data
            switch data.result{
            case .success(let data):
                print("you have data here: \(data)")
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
