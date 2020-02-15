//
//  UsersRouter.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Foundation

// Без имплементации работы сервиса. Просто отдаю данные

enum UsersRouter {
    
    private struct SampleData {
        private static let users = [UserModel(id: 1,
                                              name: "Антон",
                                              position: "CEO",
                                              avatarURL: URL(string: "https://s3.amazonaws.com/uifaces/faces/twitter/calebogden/128.jpg")),
                                    UserModel(id: 2,
                                              name: "Никита",
                                              position: "Mobile Developer",
                                              avatarURL: URL(string: "https://s3.amazonaws.com/uifaces/faces/twitter/sauro/128.jpg")),
                                    UserModel(id: 3,
                                              name: "Глеб",
                                              position: "Backend Developer",
                                              avatarURL: URL(string: "https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg"))]
        
        static func listData() -> Data? {
            return try? JSONEncoder().encode(users)
        }
        
        static func userData(by id: Int) -> Data? {
            guard let user = users.first(where: { $0.id == id }) else { return nil }
            
            return try? JSONEncoder().encode(user)
        }
    }
    
    case getUsersList
    case getUser(id: Int)
    
    func performRequest() -> Data? {
        switch self {
        case .getUsersList:
            return SampleData.listData()
        case .getUser(let id):
            return SampleData.userData(by: id)
        }
    }
}
