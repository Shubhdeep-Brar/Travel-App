//
//  Serializer.swift
//  Travel App
//
//  Created by Shubhdeep on 2023-02-09.
//

import Foundation
import UIKit

class Serializer {
    
    
    static func serialize(user: UserDM) -> String? {
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let jsonData = try encoder.encode(user)
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
       
        } catch {
            return nil
        }
    }
    
    static func deserializer(jsonString: String) -> UserDM? {
        if let jsonData = jsonString.data(using: .utf8) {
            let decoder = JSONDecoder()
            
            do{
                return try decoder.decode(UserDM.self, from: jsonData)
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
    
    static func deserializer(jsonString: String) -> [UserDM] {
        
        if let jsonData = jsonString.data(using: .utf8) {
            let decoder = JSONDecoder()
            
            do{
                return try decoder.decode([UserDM].self, from: jsonData)
            } catch {
                return []
            }
        } else {
            return []
        }
        
    }
    
    static func rawUserArrayJSon() -> String {
        return """
        [
        {
        "first_name": "John",
        "last_name": "Doe",
        "country": "Canada"
        },
        
        {
        "first_name": "Mostafa",
        "last_name": "Davoodi",
        "country": "Canada"
        },
        {
        "first_name": "Shubhdeep",
        "last_name": "Brar",
        "country": "India"
        },
        """
    }
    
    
    static func rawUserJSon() -> String {
        return """
{

"first_name": "Mostafa",
"last_name": "Davoodi",
"country": "Canada"
}
"""

    }
    
}

struct UserDM : Codable {
    
    var firstName: String
    var lastName: String
    var country: String
    
    
    enum CodingKeys: String, CodingKey {
        
       case firstName = "first_name"
       case lastName = "last_name"
       case country
        
    }
}
