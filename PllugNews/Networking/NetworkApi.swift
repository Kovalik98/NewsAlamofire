//
//  NetworkApi.swift
//  BackBrowser
//
//  Created by Kovalyk Nazar on 10/27/18.
//  Copyright © 2018 Kovalyk Nazar. All rights reserved.
//

import Foundation

// -------------------------------------
// MARK: - NetworkApiError
// -------------------------------------
enum NetworkApiError: Error {
    case containerDataNotFound
}

// -------------------------------------
// MARK: - NetworkApi
// -------------------------------------
final class NetworkApi {
    
    unowned let networkManager: NetworkManagerProtocol = NetworkManager.shared
}

// -------------------------------------
// MARK: - Requests
// -------------------------------------
extension NetworkApi {

    func getNews(for country: String = "ua", completion: @escaping Response<[Article]>) {
        let request = NewsRouter.getNews(country: country)
        networkManager.makeContaineredRequest(request, completion: completion)
    }

}
