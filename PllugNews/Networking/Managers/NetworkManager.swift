//
//  NetworkManager.swift
//  BackBrowser
//
//  Created by Kovalyk Nazar on 10/27/19.
//  Copyright © 2019 Kovalyk Nazar. All rights reserved.
//

import Foundation
import Alamofire

// -------------------------------------
// MARK: - NetworkManager
// -------------------------------------
final class NetworkManager: NetworkManagerProtocol {
    
    /* Singleton */
    static let shared = NetworkManager()
    private init() {}
}

// -------------------------------------
// MARK: - Implementation
// -------------------------------------
extension NetworkManager {
    
    func makeRequest<T: Codable>(_ request: NetworkRouterProtocol, completion: @escaping Response<T>) {

        Alamofire.request(request).validate(statusCode: 200..<300).responseData { result in

            switch result.result {
            case .success(let data):
                /// Parse responce data
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeContaineredRequest<T: Codable>(_ request: NetworkRouterProtocol, completion: @escaping Response<T>) {

        makeRequest(request) { (result: Result<ResponseContainer<T>>) in
            switch result {
            case .success(let value):
                completion(.success(value.result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}

