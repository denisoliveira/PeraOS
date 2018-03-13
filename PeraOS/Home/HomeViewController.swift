//
//  HomeViewController.swift
//  PeraOS
//
//  Created by S2IT-UOL-0048 on 13/03/18.
//  Copyright © 2018 S2IT-UOL-0048. All rights reserved.
//

import UIKit

protocol HomeView: class {
    func setupData(source users: [User])
}

class HomeViewController: UIViewController, HomeView {

    @IBOutlet weak var tableView: UITableView!
    var presenter: HomePresenter?
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        self.presenter = HomeViewControllerPresenter()
        self.presenter?.attach(view: self)
        self.presenter?.start()
    }

    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    deinit {
        presenter?.deattach()
        presenter = nil
    }
    
    func setupData(source users: [User]) {
        self.users = users
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as! UserTableViewCell
        let user = users[indexPath.row]
        cell.setupCell(
            name: user.name,
            value: user.valor
        )
        return cell
    }
}
