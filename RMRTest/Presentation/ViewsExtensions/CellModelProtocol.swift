//
//  CellModelProtocol.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit

protocol CellModelProtocol {
    
    static var cellIdentifier: String { get }
    static var cellNib: UINib { get }
    
    var cellIdentifier: String { get }
    var cellNib: UINib { get }
    
}
