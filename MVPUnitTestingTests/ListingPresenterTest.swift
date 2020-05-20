//
//  ListingPresenterTest.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MVPUnitTesting

class ListingPresenterTest: QuickSpec {
    
    var vc: ListingStubbedViewController!
    var presenter: ListingPresenter!
    let queue = DispatchQueue(label: "ListingPresenterTest")
    
    override func spec() {
        describe("Listing Presenter Test") {
            context("When init presenter with mock repository empty list and view loaded") {
                
                beforeEach {
                    self.vc = ListingStubbedViewController()
                    self.presenter = ListingUseCasesInstance.resolvePresenter(useCase: .listingFetchEmpty, view: self.vc, queue: self.queue)
                    self.presenter.viewLoaded()
                    self.queue.sync {}
                }
                
                it("Should fetch an empty list of users and behave correctly") {
                    
                    expect(self.vc.showLoadingWasCalled).to(beTrue())
                    expect(self.vc.showTitleWasCalled).to(beTrue())
                    expect(self.vc.showItemsWasCalled).to(beTrue())
                    expect(self.vc.hideLoadingWasCalled).to(beTrue())
                    expect(self.vc.showAlertWasCalled).to(beFalse())
                }
                
                it("Should fetch an empty list of users and set view correctly") {
                    expect(self.vc.title).to(equal("Users"))
                    expect(self.vc.items).to(beEmpty())
                    expect(self.vc.alertTitle).to(beNil())
                    expect(self.vc.alertMessage).to(beNil())
                }
            }
            
            context("When init presenter with mock repository 5 users and view loaded") {
                
                beforeEach {
                    self.vc = ListingStubbedViewController()
                    self.presenter = ListingUseCasesInstance.resolvePresenter(useCase: .listingFetchFiveUsers, view: self.vc, queue: self.queue)
                    self.presenter.viewLoaded()
                    self.queue.sync {}
                }
                
                it("Should fetch five users and behave correctly") {
                    expect(self.vc.showLoadingWasCalled).to(beTrue())
                    expect(self.vc.showTitleWasCalled).to(beTrue())
                    expect(self.vc.showItemsWasCalled).to(beTrue())
                    expect(self.vc.hideLoadingWasCalled).to(beTrue())
                    expect(self.vc.showAlertWasCalled).to(beFalse())
                }
                
                it("Should fetch five users and set view correctly") {
                    expect(self.vc.title).to(equal("Users"))
                    expect(self.vc.items?.count).to(be(5))
                    expect(self.vc.alertTitle).to(beNil())
                    expect(self.vc.alertMessage).to(beNil())
                }
            }
            
            context("When init presenter with mock fail repository") {
                
                beforeEach {
                    self.vc = ListingStubbedViewController()
                    self.presenter = ListingUseCasesInstance.resolvePresenter(useCase: .listingFetchError, view: self.vc, queue: self.queue)
                    self.presenter.viewLoaded()
                    self.queue.sync {}
                }
                
                it("Should fetch five users and behave correctly") {
                    expect(self.vc.showLoadingWasCalled).to(beTrue())
                    expect(self.vc.showTitleWasCalled).to(beTrue())
                    expect(self.vc.showItemsWasCalled).to(beFalse())
                    expect(self.vc.hideLoadingWasCalled).to(beTrue())
                    expect(self.vc.showAlertWasCalled).to(beTrue())
                }
                
                it("Should fetch five users and set view correctly") {
                    expect(self.vc.title).to(equal("Users"))
                    expect(self.vc.items).to(beNil())
                    expect(self.vc.alertTitle).to(equal("Error"))
                    expect(self.vc.alertMessage).to(equal("Ups! Algo salió mal"))
                }
            }
            
        }
    }
}
