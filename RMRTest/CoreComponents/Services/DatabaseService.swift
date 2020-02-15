//
//  DatabaseService.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Foundation

// Без имплементации самого сервиса

protocol DataBaseServiceProtocol {
    
    func save(models: [DatabaseModelProtocol])
    func save(model: DatabaseModelProtocol)
}
