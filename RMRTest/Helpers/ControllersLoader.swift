//
//  ControllersLoader.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit
import Swinject

final class ControllerLoader {
    
    // MARK: - External dependencies
    
    var resolver: Resolver!
    
    // MARK: - Public functions
    
    public func controller<T>(by type: T.Type, name: String? = nil) -> T {
        guard let controller = resolver.resolve(type, name: name) else {
            fatalError("ControllerLoader: Unknown controller")
        }
        
        return controller
    }
}
