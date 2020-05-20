//
//  UsersApiProtocol.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/18/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation

protocol UsersApiProtocol {
    func fetchUsers(limit: Int, completion: @escaping ((Result<[UserRepresentation], Error>) -> Void))
}
