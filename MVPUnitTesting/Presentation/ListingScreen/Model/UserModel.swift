//
//  UserModel.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/14/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation

struct UserModel {
    private let title: String
    private let firstName: String
    private let lastName: String
    
    var name: String {
        return "\(title). \(firstName) \(lastName)"
    }
    
    static func fromDomain(item: User) -> UserModel {
        return self.init(title: item.title, firstName: item.firstName, lastName: item.lastName)
    }
}
