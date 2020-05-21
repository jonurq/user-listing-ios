//
//  ListingViewController.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/13/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import UIKit

class ListingViewController: BaseViewController {
    
    let presenter: ListingPresenter
    private let reuseIdentifier = "CellIdentifier"
    private var items = [UserModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet var tableView: UITableView!

    required init(presenter: ListingPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: ListingViewController.self), bundle: Bundle.main) // Si se utiliza en una lib, utilizar el bundle de la lib
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewLoaded()
    }
    
    private func setupView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ListingViewController: ListingViewDelegate {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }
    
    func show(title: String) {
        self.title = title
    }
    
    func show(items: [UserModel]) {
        self.items = items
    }
}

extension ListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTap(user: items[indexPath.row])
    }
}
