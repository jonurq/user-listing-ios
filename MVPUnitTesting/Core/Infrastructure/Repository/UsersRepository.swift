//
//  UsersRepository.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/14/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation

class UsersRepository: UsersRepositoryProtocol {
    
    let service: UsersApiProtocol
    
    init(service: UsersApiProtocol) {
        self.service = service
    }
    
    func getUsers(limit: Int, onSuccess: @escaping ([User]) -> Void, onError: @escaping (Error) -> Void) {
        service.fetchUsers(limit: limit) { result in
            switch(result) {
            case .success(let usersRepresentation):
                onSuccess(usersRepresentation.map { $0.toModel() })
                break
                
            case .failure(let error):
                onError(error)
                break
            }
        }
    }
}
