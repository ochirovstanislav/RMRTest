//
//  UserModel.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import Foundation

struct UserModel: DatabaseModelProtocol, Codable {
    let id: Int
    let name: String
    let position: String
    let avatarURL: URL?
}
