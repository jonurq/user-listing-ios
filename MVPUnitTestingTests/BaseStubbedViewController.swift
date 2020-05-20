//
//  BaseStubbedViewController.swift
//  MVPUnitTestingTests
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation
@testable import MVPUnitTesting

class BaseStubbedViewController: BaseViewDelegate {
    
    var showLoadingWasCalled = false
    var hideLoadingWasCalled = false
    
    func showLoading() {
        showLoadingWasCalled = true
    }
    
    func hideLoading() {
        hideLoadingWasCalled = true
    }
}
