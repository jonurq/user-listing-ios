//
//  ListingPresenter.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/13/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import Foundation

class ListingPresenter {
    
    weak var view: ListingViewDelegate?
    let repository: UsersRepository
    let limit = 20
    
    required init(repository: UsersRepository) {
        self.repository = repository
    }
    
    func viewLoaded() {
        view?.show(title: "Users")
        getUsers()
    }
    
    private func getUsers() {
        view?.showLoading()
        repository.getUsers(limit: limit, onSuccess: { (users) in
            DispatchQueue.main.async {
                self.view?.hideLoading()
                self.view?.show(items: users.map { UserModel.fromDomain(item: $0) })
            }
        }) { (error) in
            //TODO: Handle all error cases
            DispatchQueue.main.async {
                self.view?.hideLoading()
                self.view?.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
}
