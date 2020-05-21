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
    
    override func spec() {
        describe("Listing View Controller Test") {
            context("When View is loaded with success five users") {
                
                beforeEach {
                    let stub = ListingViewControllerMock()
                    self.viewController = ListingViewController(presenter: ListingUseCasesInstance.resolvePresenter(useCase: .listingFetchFiveUsers, view: stub, queue: DispatchQueue.main))
                    self.viewController.presenter.view = self.viewController
                    self.viewController.loadView()
                    self.viewController.viewDidLoad()
                }
                
                it("Should view setup propertly") {
                    
                    expect(self.viewController.spinner.isDescendant(of: self.viewController.view)).to(beTrue())
                    expect(self.viewController.tableView.dataSource).to(be(self.viewController))
                    expect(self.viewController.tableView.delegate).to(be(self.viewController))
                    
                    let exp = self.expectation(description: "wait for ui changes")
                    DispatchQueue.main.async {
                        expect(self.viewController.title).to(equal("Users"))
                        expect(self.viewController.tableView).toNot(beNil())
                        expect(self.viewController.tableView(self.viewController.tableView, numberOfRowsInSection: 0)).to(equal(5))
                        expect(self.viewController.numberOfSections(in: self.viewController.tableView)).to(equal(1))
                        expect(self.viewController.spinner.isDescendant(of: self.viewController.view)).to(beFalse())
                        exp.fulfill()
                    }
                    
                    self.waitForExpectations(timeout: 5, handler: nil)
                    
                }
            }
            
            context("When View is loaded with error") {
                
                beforeEach {
                    let stub = ListingViewControllerMock()
                    self.viewController = ListingViewController(presenter: ListingUseCasesInstance.resolvePresenter(useCase: .listingFetchError, view: stub, queue: DispatchQueue.main))
                    self.viewController.presenter.view = self.viewController
                    self.viewController.loadView()
                    self.viewController.viewDidLoad()
                }
                
                it("Should view setup propertly") {
                    
                    expect(self.viewController.spinner.isDescendant(of: self.viewController.view)).to(beTrue())
                    
                    let exp = self.expectation(description: "wait for ui changes")
                    DispatchQueue.main.async {
                        expect(self.viewController.title).to(equal("Users"))
                        expect(self.viewController.tableView).toNot(beNil())
                        expect(self.viewController.tableView(self.viewController.tableView, numberOfRowsInSection: 0)).to(equal(0))
                        expect(self.viewController.numberOfSections(in: self.viewController.tableView)).to(equal(1))
                        expect(self.viewController.spinner.isDescendant(of: self.viewController.view)).to(beFalse())
                        exp.fulfill()
                    }
                    
                    self.waitForExpectations(timeout: 5, handler: nil)
                    
                }
            }
        }
    }
}


