//
//  UsersListViewModel.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import RxSwift
import RxCocoa

final class UsersListViewModel {
    
    var usersRepository: UsersRepositoryProtocol
    var dataConverter: UsersListDataConverterProtocol
    var coordinator: CoordinatorType?
    
    var cellModels = BehaviorRelay<[CellModelProtocol]>(value: [])
    
    private var users: [UserModel]?
    
    init(usersRepository: UsersRepositoryProtocol?,
         dataConverter: UsersListDataConverterProtocol?,
         coordinator: CoordinatorType?) {
        guard
            let usersRepository = usersRepository,
            let dataConverter = dataConverter,
            let coordinator = coordinator
            else { fatalError("error init UsersListViewModel" )}
        
        self.usersRepository = usersRepository
        self.dataConverter = dataConverter
        self.coordinator = coordinator
        
        setup()
    }
    
    
    func onTapOnRow(at index: Int) {
        guard let users = users, index < users.count else { return }
        let user = users[index]
        
        coordinator?.performTransition(transition: .openUserInfo(id: user.id))
    }
}

extension UsersListViewModel {
    
    private func setup() {
        /*
         Обычно я обсервлю базу на изменения и дергаю новые данные с бэка.
         То есть в репозитории есть 3 метода:
         ObserveList - вовращает Observer
         ObtainList - возвращает массив данных
         UpdateList - дергает новые данные с бэка и сохраняет их в базу
         
         Тут решил не оверхедить т.к. задача состояла в другом
        */
        
        if let users = usersRepository.obtainUsersList() {
            self.users = users
            
            cellModels.accept(users.compactMap { [weak self] user in
                return self?.dataConverter.obtainCellModel(for: user)
            })
        }
    }
}
