//
//  LoadingViewController.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/19/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    var spinner = UIActivityIndicatorView(style: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
