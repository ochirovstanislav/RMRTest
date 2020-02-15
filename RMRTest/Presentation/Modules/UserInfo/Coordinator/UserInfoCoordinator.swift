//
//  UserInfoCoordinator.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit

final class UserInfoCoordinator: CoordinatorType {
    
    var controllerLoader: ControllerLoader! {
        didSet {
            baseController = controllerLoader.controller(by: UsersListVC.self)
        }
    }
    var baseController: UIViewController?
    
    func performTransition(transition: Transition) {
        switch transition {
        case .popBack:
            baseController?.navigationController?.popViewController(animated: true)
        default:
            break
        }
    }
}
