//
//  ModernNetworking.swift
//  Travel App
//
//  Created by Shubhdeep on 2023-03-23.
//

import Foundation
import Alamofire

class ModernNetworking {
    
    static func mockApi() {
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
    }
    
    static func mockApi2() {
        
        AF.request("https://httpbin.org/status/404")
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                    case .success:
                    print("success")
                case .failure(let error):
                    print(error)
                    print(response.response?.statusCode)
                }
            }
    }
    
    static func mockApi3(completionHandler: @escaping (AFDataResponse<Data?>) -> ()) {
        AF.request("https://httpbin.org/get")
            .response(completionHandler: completionHandler)
    }
    
    static func mockApi4() {
        let params: [String: Any] = [
            "v": "12344566",
            "page": 1
        ]
        
        AF.request("https://httpbin.org/get", parameters: params).responseDecodable(of: HTTPBinResponse.self) { response in
            if case let .success(data) = response.result{
                print(data.args)
            }
        }
}
    
    static func mockAPi5() {
        let params = [
            "first_name": "Mostafa",
            "last_name":  "Davoodi"
        ]
        AF.request("https://httpbin.org/post", method: .post, parameters: params).response { response in
            print(response)
        }
    }
    static func mockAPi6() {
        let data = loginData(username: "Shubhdeep", password: "1234674")
        AF.request("https://httpbin.org/post", method: .post, parameters: data, encoder: JSONParameterEncoder.default).response {response in
            print(response)
        }
    }
//    static func mockApi7() {
//        let headers = HTTPHeaders = [
//            "Authorization": "Basic jbcndsjncudnkcewkwcefrvgds"
//        ]
//        AF.request("https://httpbin.org/get", headers: headers).response { response in
//            print(response)
//        }
//    }

struct HTTPBinResponse: Codable {
    let args: [String:String]
}
    
    struct loginData: Codable {
        let username: String
        let password: String
        
    }
    
}
