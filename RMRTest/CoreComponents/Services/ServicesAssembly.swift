//
//  ServicesAssembly.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Swinject

final class ServicesAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(UsersService.self) { r in
            return UsersService()
        }
    }
}
