//
//  RepositoriesAssembly.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Swinject

final class RepositoriesAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UsersRepository.self) { r in
            let usersRepostiory = UsersRepository()
            
            usersRepostiory.usersService = r.resolve(UsersService.self)
            usersRepostiory.databaseService = nil
            return usersRepostiory
        }
    }
}
