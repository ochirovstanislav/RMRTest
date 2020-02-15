//
//  UsersListVC.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class UsersListVC: UIViewController {
    
    private struct Constants {
        static let title: String = "Пользователи"
    }
    
    var viewModel: UsersListViewModel!
    var dataSource: UsersListDataSourceProtocol!

    @IBOutlet private weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}

extension UsersListVC {
    
    private func setupUI() {
        title = Constants.title
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        dataSource.setup(with: tableView,
                         cellModels: viewModel.cellModels)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
}

extension UsersListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.onTapOnRow(at: indexPath.row)
    }
}
