//
//  UsersListAssembly.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Swinject

final class UsersListAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UsersListVC.self) { r in
            return UsersListVC()
        }.initCompleted { (r, view) in
            view.viewModel = r.resolve(UsersListViewModel.self)
            view.dataSource = r.resolve(UsersListDataSource.self)
        }
        
        container.register(UsersListViewModel.self) { r in
            let usersRepository = r.resolve(UsersRepository.self)
            let dataConverter = r.resolve(UsersListDataConverter.self)
            let usersListCoordinator = r.resolve(UsersListCoordinator.self)
            
            return UsersListViewModel(usersRepository: usersRepository,
                                      dataConverter: dataConverter,
                                      coordinator: usersListCoordinator)
        }
        
        container.register(UsersListDataConverter.self) { r in
            return UsersListDataConverter()
        }
        
        container.register(UsersListDataSource.self) { r in
            return UsersListDataSource()
        }
        
        container.register(UsersListCoordinator.self) { r in
            return UsersListCoordinator()
        }.initCompleted { (r, coordinator) in
            coordinator.controllerLoader = r.resolve(ControllerLoader.self)
        }
    }
    
}
