//
//  ListingRepositoryMock.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
@testable import MVPUnitTesting

class UserRepositoryMock: UsersRepository {
    
    var mock: [User]?
    
    
    init(_ mock: [User]? = nil) {
        self.mock = mock
    }
    
    func getUsers(limit: Int, onSuccess: @escaping ([User]) -> Void, onError: @escaping (Error) -> Void) {
        if let mock = mock {
            onSuccess(mock)
        } else {
            onError(ApiError.noData)
        }
    }
}
