//
//  UserInfoViewModel.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import RxSwift
import RxCocoa

final class UserInfoViewModel {
    
    var usersRepository: UsersRepositoryProtocol!
    var coordinator: CoordinatorType!
    var userId: Int? {
        didSet {
            guard let userId = userId else { return }
            
            setup(with: userId)
        }
    }
    
    let avatarURL = BehaviorRelay<URL?>(value: nil)
    let nameText = BehaviorRelay<String?>(value: nil)
    let positionText = BehaviorRelay<String?>(value: nil)
    
    init(usersRepository: UsersRepositoryProtocol?,
         coordinator: CoordinatorType?) {
        guard
            let usersRepository = usersRepository,
            let coordinator = coordinator
            else { fatalError("error init UserInfoViewModel") }
        
        self.usersRepository = usersRepository
        self.coordinator = coordinator
    }
    
    private func setup(with userId: Int) {
        if let user = usersRepository.obtainUser(by: userId) {
            avatarURL.accept(user.avatarURL)
            nameText.accept(user.name)
            positionText.accept(user.position)
        }
    }
}
