//
//  UserInfoVC.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class UserInfoVC: UIViewController {
    
    private struct Constants {
        static let title: String = "Профиль"
    }
    
    var viewModel: UserInfoViewModel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        avatarImageView.round()
    }
}

extension UserInfoVC {
    
    private func setupUI() {
        title = Constants.title
    }
    
    private func bindUI() {
        viewModel
            .avatarURL
            .subscribe(onNext: { [weak self] (url) in
                self?.avatarImageView.sd_setImage(with: url)
            })
            .disposed(by: disposeBag)
        
        viewModel
            .nameText
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel
            .positionText
            .bind(to: positionLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
