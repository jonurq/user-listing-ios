//
//  ListingStubbedViewController.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
@testable import MVPUnitTesting

class ListingStubbedViewController: BaseStubbedViewController, ListingViewDelegate {
    
    var title: String?
    var items: [UserModel]?
    var alertTitle: String?
    var alertMessage: String?
    
    var showTitleWasCalled = false
    var showItemsWasCalled = false
    var showAlertWasCalled = false
    
    
    func show(title: String) {
        self.title = title
        showTitleWasCalled = true
    }
    
    func show(items: [UserModel]) {
        self.items = items
        showItemsWasCalled = true
    }
    
    func showAlert(title: String, message: String) {
        self.alertTitle = title
        self.alertMessage = message
        showAlertWasCalled = true
    }
}
