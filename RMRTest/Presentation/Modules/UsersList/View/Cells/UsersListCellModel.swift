//
//  UsersListCellModel.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit

struct UsersListCellModel: CellModelProtocol {
    
    static var cellIdentifier: String = "UsersListCellIdentifier"
    static var cellNib: UINib = UINib(nibName: "UsersListCell", bundle: nil)
    
    var cellIdentifier: String { return Self.cellIdentifier }
    var cellNib: UINib { return Self.cellNib }
    
    let avatarURL: URL?
    let nameText: String
    let positionText: String
    
}
