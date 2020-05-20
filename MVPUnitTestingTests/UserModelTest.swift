//
//  UserModel.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MVPUnitTesting

class UserModelTest: QuickSpec {
    override func spec() {
        describe("User Model Test") {
            context("When initialize User Model with User") {
                it("should return a correct User") {
                    let userModel = UserModel.fromDomain(user: self.createUser())
                    
                    expect(userModel.name).to(equal("Mr. Jonatan Urquiza"))
                }
            }
        }
    }
    
    private func createUser() -> User {
        return User(title: "Mr.", firstName: "Jonatan", lastName: "Urquiza")
    }
}

