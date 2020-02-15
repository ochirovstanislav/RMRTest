//
//  UsersService.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Foundation

final class UsersService: UsersServiceProtocol {
    
    func getUsersList() -> [UserModel]? {
        guard let data = UsersRouter.getUsersList.performRequest() else { return nil }
        
        return try? JSONDecoder().decode([UserModel].self, from: data)
    }
    
    func getUser(by id: Int) -> UserModel? {
        guard let data = UsersRouter.getUser(id: id).performRequest() else { return nil }
        
        return try? JSONDecoder().decode(UserModel.self, from: data)
    }
    
}
