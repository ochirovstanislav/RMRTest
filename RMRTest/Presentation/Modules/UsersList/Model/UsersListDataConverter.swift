//
//  UsersListDataConverter.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit

protocol UsersListDataConverterProtocol {
    
    func obtainCellModel(for userModel: UserModel) -> CellModelProtocol
}

final class UsersListDataConverter: UsersListDataConverterProtocol {
    
    func obtainCellModel(for userModel: UserModel) -> CellModelProtocol {
        return UsersListCellModel(avatarURL: userModel.avatarURL,
                                 nameText: userModel.name,
                                 positionText: userModel.position)
    }
}
