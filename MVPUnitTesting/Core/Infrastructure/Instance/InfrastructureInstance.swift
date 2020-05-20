//
//  InfrastructureInstance.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/18/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation

class InfrastructureInstance {
    static let baseUrl = "https://randomuser.me/"
    
    static func usersRepository() -> UsersRepositoryProtocol {
        return UsersRepository(service:
            URLSessionUsersApi(baseUrl: InfrastructureInstance.baseUrl))
    }
}
