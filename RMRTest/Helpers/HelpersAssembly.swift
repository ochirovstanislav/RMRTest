//
//  HelpersAssembly.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Swinject

final class HelpersAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ControllerLoader.self) { r in
            let controllerLoader = ControllerLoader()
            
            controllerLoader.resolver = r
            return controllerLoader
        }
    }
}
