//
//  UsersApiImplementation.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/18/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation

class UsersApiImplementation: UsersApi {
    
    let baseUrl: String
    private let urlSession = URLSession.shared
    
    required init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func fetchUsers(limit: Int, completion: @escaping (Result<[UserRepresentation], Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)api?results=\(limit)") else {
            completion(.failure(ApiError.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        urlSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(ResponseRepresentation.self, from: data) {
                completion(.success(decodedResponse.results))
                return
            }
            completion(.failure(ApiError.parseError))
            
        }.resume()
        
    }
}
