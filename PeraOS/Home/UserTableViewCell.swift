//
//  UserTableViewCell.swift
//  PeraOS
//
//  Created by S2IT-UOL-0048 on 13/03/18.
//  Copyright © 2018 S2IT-UOL-0048. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(name: String, value: String) {
        self.nameLabel.text = name
        self.valueLabel.text = value
    }
}
