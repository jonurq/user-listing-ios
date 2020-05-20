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
    let queue: DispatchQueue
    let limit = 20
    
    required init(repository: UsersRepository, queue: DispatchQueue) {
        self.repository = repository
        self.queue = queue
    }
    
    func viewLoaded() {
        //TODO: Localize string
        view?.show(title: "Users")
        getUsers()
    }
    
    func itemTap(user: UserModel) {
        self.queue.async {
            self.view?.showAlert(title: "User", message: user.name)
        }
    }
    
    private func getUsers() {
        view?.showLoading()
        repository.getUsers(limit: limit, onSuccess: { (users) in
            self.queue.async {
                self.view?.hideLoading()
                self.view?.show(items: users.map { UserModel.fromDomain(user: $0) })
            }
        }) { (error) in
            //TODO: Handle all infra error cases to show more detailed message to user
            self.queue.async {
                self.view?.hideLoading()
                self.view?.showAlert(title: "Error", message: "Ups! Algo salió mal")
            }
        }
    }
}
