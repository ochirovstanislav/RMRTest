//
//  UsersListDataSourceProtocol.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol UsersListDataSourceProtocol {
    
    func setup(with tableView: UITableView, cellModels: BehaviorRelay<[CellModelProtocol]>)
}
