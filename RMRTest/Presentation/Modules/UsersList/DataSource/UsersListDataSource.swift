//
//  UsersListDataSource.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class UsersListDataSource {
    
    private var tableView: UITableView?
    private let disposeBag = DisposeBag()
}

extension UsersListDataSource: UsersListDataSourceProtocol {
    
    func setup(with tableView: UITableView, cellModels: BehaviorRelay<[CellModelProtocol]>) {
        self.tableView = tableView
        
        cellModels
            .do(onNext: { (cellModels) in
                cellModels.forEach { tableView.register($0.cellNib,
                                                        forCellReuseIdentifier: $0.cellIdentifier)}})
            .bind(to: tableView.rx.items) { table, index, element in
                let cell = table.dequeueReusableCell(withIdentifier: element.cellIdentifier)!
                
                if let cell = cell as? UsersListCell,
                    let element = element as? UsersListCellModel {
                    cell.setup(with: element)
                }
                
                return cell }
            .disposed(by: disposeBag)
    }
}

