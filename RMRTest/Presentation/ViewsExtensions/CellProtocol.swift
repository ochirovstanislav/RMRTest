//
//  CellProtocol.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Foundation

protocol CellProtocol {
    associatedtype modelType: CellModelProtocol
    
    func setup(with model: modelType)
}
