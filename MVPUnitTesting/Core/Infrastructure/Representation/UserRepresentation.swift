//
//  UserRepresentation.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/18/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation

struct UserRepresentation: Codable {
    let name: NameRepresentation
    
    func toModel() -> User {
        return User(title: name.title, firstName: name.first, lastName: name.last)
    }
}

struct NameRepresentation: Codable {
    let title: String
    let first: String
    let last: String
}
