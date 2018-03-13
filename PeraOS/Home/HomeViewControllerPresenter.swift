//
//  HomeViewControllerPresenter.swift
//  PeraOS
//
//  Created by S2IT-UOL-0048 on 13/03/18.
//  Copyright © 2018 S2IT-UOL-0048. All rights reserved.
//

import Foundation

protocol HomePresenter: class {
    func attach(view: HomeView)
    func deattach()
    func start()
}

class HomeViewControllerPresenter: HomePresenter {
 
    weak var view: HomeView?
    
    func attach(view: HomeView) {
        self.view = view
    }

    func deattach() {
        self.view = nil
    }
    
    func start() {
        let url = URL(string: "http://www.mocky.io/v2/5aa825462f00001a3e8ea8d7")!        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            
            guard let data = data else {
                print("Empty data.")
                return
            }
            
            let decoder = JSONDecoder()
            guard let users = try? decoder.decode([User].self, from: data) else {
                print("Incorrect format.")
                return
            }
            
            DispatchQueue.main.async {
                self.view?.setupData(source: users)
            }
        }
        dataTask.resume()
    }
}
