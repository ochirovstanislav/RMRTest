//
//  CoordinatorType.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit

protocol CoordinatorType: class {
    
    var controllerLoader: ControllerLoader! { get set }
    var baseController: UIViewController? { get }
    
    func performTransition(transition: Transition)
    
}
