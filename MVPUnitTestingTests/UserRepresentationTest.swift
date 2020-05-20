//
//  UserRepresentationTest.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MVPUnitTesting

class UserRepresentationTest: QuickSpec {
    
    var nameRepresentation: NameRepresentation!
    var userRepresentation: UserRepresentation!
    
    override func spec() {
        describe("User Representation Test") {
            context("When initialize the representation") {
                
                beforeEach {
                    self.nameRepresentation = NameRepresentation(title: "Mr.", first: "Jonatán", last: "Urquiza")
                    self.userRepresentation = UserRepresentation(name: self.nameRepresentation)
                }
                
                it("Should be setted propertly") {
                    expect(self.userRepresentation.name.title).to(equal("Mr."))
                    expect(self.userRepresentation.name.first).to(equal("Jonatán"))
                    expect(self.userRepresentation.name.last).to(equal("Urquiza"))
                }
                
                it("Should return correct User Model") {
                    let userModel = self.userRepresentation.toModel()
                    
                    expect(userModel.title).to(equal("Mr."))
                    expect(userModel.firstName).to(equal("Jonatán"))
                    expect(userModel.lastName).to(equal("Urquiza"))
                }
            }
        }
    }
    
}
