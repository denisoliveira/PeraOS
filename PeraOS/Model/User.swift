//
//  User.swift
//  PeraOS
//
//  Created by S2IT-UOL-0048 on 13/03/18.
//  Copyright © 2018 S2IT-UOL-0048. All rights reserved.
//

import Foundation

struct User: Codable {
    var name: String
    var value: String
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "valor"
    }
}
