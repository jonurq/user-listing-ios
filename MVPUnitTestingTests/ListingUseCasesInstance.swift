//
//  ListingUseCasesInstance.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
@testable import MVPUnitTesting

class ListingUseCasesInstance {
    
    static func resolvePresenter(useCase: ListingUseCase, view: ListingViewDelegate, queue: DispatchQueue) -> ListingPresenter {
        let presenter = ListingPresenter(repository: resolveRepository(useCase: useCase), queue: queue)
        presenter.view = view
        return presenter
    }
    
    static func resolveRepository(useCase: ListingUseCase) -> UsersRepository {
        switch useCase {
        case .listingFetchEmpty:
            let mock = mockUsers(count: 0)
            return UserRepositoryMock(mock)
        case .listingFetchError:
            return UserRepositoryMock()
        case .listingFetchFiveUsers:
            let mock = mockUsers(count: 5)
            return UserRepositoryMock(mock)
        }
    }
    
    private static func mockUsers(count: Int) -> [User] {
        var users = [User]()
        for i in 0..<count {
            users.append(User(title: "Mr.", firstName: "User", lastName: "\(i)"))
        }
        return users
    }
}
