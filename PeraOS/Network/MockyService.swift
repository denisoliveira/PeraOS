//
//  MockyService.swift
//  PeraOS
//
//  Created by S2IT-UOL-0048 on 13/03/18.
//  Copyright © 2018 S2IT-UOL-0048. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol Service {
    func data() -> Observable<[User]>
}

class MockyService: Service {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func data() -> Observable<[User]> {
        let request = URLRequest.init(url: URL.init(string: "http://www.mocky.io/v2/5aa825462f00001a3e8ea8d7")!)
        return session.rx.data(request: request).flatMap { data -> Observable<[User]> in
            let decoder = JSONDecoder()
            guard let users = try? decoder.decode([User].self, from: data) else {
                print("Incorrect format.")
                return Observable.error(NSError.init(domain: "com.denisoliveira.peraos", code: -1, userInfo: nil))
            }
            return Observable.just(users)
        }
    }
}
