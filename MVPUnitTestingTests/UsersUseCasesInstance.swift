//
//  UsersUseCasesInstance.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
@testable import MVPUnitTesting

class UsersUseCasesInstance {
    static func resolveUsersRepository(useCase: UsersUseCase) -> UsersRepository {
        let usersRepository = UsersRepository(service: resolveUsersApi(useCase: useCase))
        return usersRepository
    }
    
    static private func resolveUsersApi(useCase: UsersUseCase) -> UsersApiProtocol {
        switch useCase {
        case .success:
            return UsersApiMock()
        case .failure:
            return UsersApiMock(shouldFail: true)
        }
    }
}
