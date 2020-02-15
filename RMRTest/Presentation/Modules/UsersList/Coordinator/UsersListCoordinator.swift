//
//  UsersListCoordinator.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit

final class UsersListCoordinator: CoordinatorType {
    
    var controllerLoader: ControllerLoader! {
        didSet {
            baseController = controllerLoader.controller(by: UsersListVC.self)
        }
    }
    var baseController: UIViewController?
    
    func performTransition(transition: Transition) {
        switch transition {
        case .openUserInfo(let id):
            let userInfoVC = controllerLoader.controller(by: UserInfoVC.self)
            
            // Спорный момент с присваиванием id в этом месте 
            userInfoVC.viewModel.userId = id
            baseController?.navigationController?.pushViewController(userInfoVC,
                                                                     animated: true)
        default:
            break
        }
    }
}
