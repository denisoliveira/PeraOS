//
//  HomeViewControllerPresenter.swift
//  PeraOS
//
//  Created by S2IT-UOL-0048 on 13/03/18.
//  Copyright © 2018 S2IT-UOL-0048. All rights reserved.
//

import Foundation
import RxSwift

protocol HomePresenter: class {
    func attach(view: HomeView)
    func deattach()
    func start() -> Observable<[User]>
}

class HomeViewControllerPresenter: HomePresenter {
    private let service: Service
    weak var view: HomeView?
    
    init(service: Service = MockyService.init()) {
        self.service = service
    }
    
    func attach(view: HomeView) {
        self.view = view
    }

    func deattach() {
        self.view = nil
    }
    
    func start() -> Observable<[User]> {
       return service.data()
    }
}
