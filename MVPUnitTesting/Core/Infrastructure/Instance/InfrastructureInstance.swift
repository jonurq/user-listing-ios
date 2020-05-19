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
    
    static func usersRepository() -> UsersRepository {
        return UsersRepositoryImplementation(service:
            UsersApiImplementation(baseUrl: InfrastructureInstance.baseUrl))
    }
}
