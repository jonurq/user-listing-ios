//
//  ListingMockInstance.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MVPUnitTesting

class ListingInstanceTest: QuickSpec {
    override func spec() {
        describe("Listing Instance Test") {
            context("When call viewController") {
                it("Should return ViewController with presenter setted") {
                    let viewController = ListingInstance.viewController()
                    
                    expect(viewController.presenter).toNot(beNil())
                    expect(viewController.presenter.view).to(be(viewController))
                }
            }
            
        }
    }
    
}
