//
//  APIManager.swift
//  Space-Launch-Now
//
//  Created by EAPPLE on 19/05/2023.
//

import Alamofire
import Foundation

struct APIManager {
    
    static func performGetRequest(urlString: String, success: @escaping (Data) -> Void, failure: @escaping (AppError)->Void) {
        
        AF.request(urlString, method: .get)
            .validate()
            .responseData { response in
                
                switch response.result {
                    case .success(let value):
                        success(value)
                        
                    case .failure:
                        failure(.default)
                }
            }
    }
}
