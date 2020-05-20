//
//  UsersRepositoryImplementationTest.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MVPUnitTesting

class UsersRepositoryImplementationTest: QuickSpec {
    
    var repository: UsersRepositoryImplementation!
    
    override func spec() {
        describe("Users Repository Implementation Test") {
            context("When initialize repository with success mock UserApi") {
                
                beforeEach {
                    self.repository = UsersUseCasesInstance.resolveUsersRepository(useCase: .success)
                }
                
                it("Should return success with data") {
                    self.repository.getUsers(limit: 5, onSuccess: { (users) in
                        expect(users.count).to(equal(5))
                    }) { (error) in
                        fail()
                    }
                    
                }
            }
            
            context("When initialize repository with failed mock UserApi") {
                
                beforeEach {
                    self.repository = UsersUseCasesInstance.resolveUsersRepository(useCase: .failure)
                }
                
                it("Should return error") {
                    self.repository.getUsers(limit: 5, onSuccess: { (users) in
                        fail()
                    }) { (error) in
                        expect(error).toNot(beNil())
                    }
                }
            }
        }
    }
}
