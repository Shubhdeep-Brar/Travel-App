//
//  Networking.swift
//  Travel App
//
//  Created by Shubhdeep on 2023-03-22.
//

import Foundation

class Networking {
    
    static func makeMockApi() {
        
        let session = URLSession.shared
        let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
        
        let task = session.dataTask(with: url) {data, response, error in
          
            if let error = error {
                self.handle(error: error)
            } else {
                if let data = data,
                   let response = response as? HTTPURLResponse,
                   (200...209).contains(response.statusCode){
                    print("working")
                } else {
                    print("not working")
                }
            }
            
        }
        task.resume()
    }
    static func handle(error: Error) {
        print("Error is :\(error.localizedDescription)")
    }
    
}
