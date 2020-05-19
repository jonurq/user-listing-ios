//
//  UsersRepository.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/14/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation

protocol UsersRepository {
    func getUsers(limit: Int, onSuccess: @escaping ([User]) -> Void, onError: @escaping (Error) -> Void)
}
