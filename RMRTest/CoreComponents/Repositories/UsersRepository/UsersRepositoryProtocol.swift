//
//  UsersRepositoryProtocol.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Foundation

protocol UsersRepositoryProtocol {
    
    func obtainUsersList() -> [UserModel]?
    func obtainUser(by id: Int) -> UserModel?
}
