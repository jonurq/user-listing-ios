//
//  BaseViewController.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewDelegate {
    
    var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .white)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    func showLoading() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideLoading() {
        if spinner.isDescendant(of: self.view) {
            spinner.stopAnimating()
            spinner.removeFromSuperview()
        }
    }
}
