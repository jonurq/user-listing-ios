//
//  ListingInstance.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/13/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation

class ListingInstance {
    static func viewController() -> ListingViewController {
        let presenter = ListingInstance.presenter()
        let viewController = ListingViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
    
    static private func presenter() -> ListingPresenter {
        return ListingPresenter(repository: InfrastructureInstance.usersRepository())
    }
}
