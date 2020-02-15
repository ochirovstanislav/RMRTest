//
//  UsersRepository.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Foundation

final class UsersRepository: UsersRepositoryProtocol {
    
    var usersService: UsersServiceProtocol!
    var databaseService: DataBaseServiceProtocol?
    
    func obtainUsersList() -> [UserModel]? {
        guard let users = usersService.getUsersList() else { return nil }
        
        databaseService?.save(models: users)
        return users
    }
    
    func obtainUser(by id: Int) -> UserModel? {
        guard let user = usersService.getUser(by: id) else { return nil }
        
        databaseService?.save(model: user)
        return user
    }
}
