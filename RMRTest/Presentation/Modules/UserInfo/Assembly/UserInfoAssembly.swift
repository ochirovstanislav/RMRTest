//
//  UserInfoAssembly.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Swinject

final class UserInfoAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UserInfoVC.self) { r in
            UserInfoVC()
        }.initCompleted { (r, view) in
            view.viewModel = r.resolve(UserInfoViewModel.self)
        }
        
        container.register(UserInfoViewModel.self) { r in
            let userRepository = r.resolve(UsersRepository.self)
            let coordinator = r.resolve(UserInfoCoordinator.self)
            
            return UserInfoViewModel(usersRepository: userRepository,
                                     coordinator: coordinator)
        }
        
        container.register(UserInfoCoordinator.self) { r in
            return UserInfoCoordinator()
        }.initCompleted { (r, coordinator) in
            coordinator.controllerLoader = r.resolve(ControllerLoader.self)
        }
    }
}
