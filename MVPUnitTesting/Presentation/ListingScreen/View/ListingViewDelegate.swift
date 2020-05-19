//
//  ListingViewDelegate.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/13/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation

protocol ListingViewDelegate: BaseViewDelegate {
    func show(title: String)
    func show(items: [UserModel])
    func showAlert(title: String, message: String)
}
