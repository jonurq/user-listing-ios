//
//  UsersApiMock.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
@testable import MVPUnitTesting

class UsersApiMock: UsersApiProtocol {
    
    var shouldFail: Bool
    
    required init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }
    
    func fetchUsers(limit: Int, completion: @escaping ((Result<[UserRepresentation], Error>) -> Void)) {
        if !shouldFail {
            completion(.success(mockUsers(count: limit)))
        } else {
            completion(.failure(ApiError.noData))
        }
    }
    
    private func mockUsers(count: Int) -> [UserRepresentation] {
        var users = [UserRepresentation]()
        for i in 0..<count {
            users.append(UserRepresentation(name: NameRepresentation(title: "Mr.", first: "User", last: "\(i)")))
        }
        return users
    }
}
