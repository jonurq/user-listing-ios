//
//  BaseViewController.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewDelegate {
    
    let loadingViewController = LoadingViewController()
    
    func showLoading() {
        addChild(loadingViewController)
        loadingViewController.view.frame = view.frame
        view.addSubview(loadingViewController.view)
        loadingViewController.didMove(toParent: self)
    }
    
    func hideLoading() {
        loadingViewController.willMove(toParent: nil)
        loadingViewController.view.removeFromSuperview()
        loadingViewController.removeFromParent()
    }
}
