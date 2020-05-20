//
//  ListingViewControllerTest.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/20/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MVPUnitTesting

class ListingViewControllerTest: QuickSpec {
    
    var viewController: ListingViewController!
    let queue = DispatchQueue(label: "ListingViewControllerTest")
    
    override func spec() {
        describe("Listing View Controller Test") {
            context("When View is loaded") {
                
                beforeEach {
                    let stub = ListingStubbedViewController()
                    self.viewController = ListingViewController(presenter: ListingUseCasesInstance.resolvePresenter(useCase: .listingFetchFiveUsers, view: stub, queue: self.queue))
                }
                
                it("Should view setup propertly") {
                    expect(self.viewController.tableView).toNot(beNil())
                }
            }
        }
    }
}
