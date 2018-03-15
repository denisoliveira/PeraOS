//
//  HomeViewController.swift
//  PeraOS
//
//  Created by S2IT-UOL-0048 on 13/03/18.
//  Copyright © 2018 S2IT-UOL-0048. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol HomeView: class {
    func setupData(source users: [User])
}

class HomeViewController: UIViewController, HomeView {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenter?
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = HomeViewControllerPresenter()
        self.presenter?.attach(view: self)
        self.presenter?.start().observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "CELL", cellType: UserTableViewCell.self)) { (_, user, cell) in
                cell.setupCell(name: user.name, value: user.value)
            }.disposed(by: disposeBag)
    }
    
    deinit {
        presenter?.deattach()
        presenter = nil
    }
    
    func setupData(source users: [User]) {
        // self.users = users
        // tableView.reloadData()
        
//        viewModel.languages
//            .observeOn(MainScheduler.instance)
//            .bind(to: tableView.rx.items(cellIdentifier: "LanguageCell", cellType: UITableViewCell.self)) { (_, language, cell) in
//                cell.textLabel?.text = language
//                cell.selectionStyle = .none
//            }
//            .disposed(by: disposeBag)
//
//        tableView.rx.modelSelected(String.self)
//            .bind(to: viewModel.selectLanguage)
//            .disposed(by: disposeBag)
//
//        cancelButton.rx.tap
//            .bind(to: viewModel.cancel)
//            .disposed(by: disposeBag)
    }
}
