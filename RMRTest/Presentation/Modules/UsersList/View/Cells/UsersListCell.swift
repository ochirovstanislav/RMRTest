//
//  UsersListCell.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit
import SDWebImage

final class UsersListCell: UITableViewCell {
    typealias modelType = UsersListCellModel
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var positionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.round()
    }
    
}

extension UsersListCell {
    
    private func setupUI() {
        avatarImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
    }
}

extension UsersListCell: CellProtocol {
    
    func setup(with model: UsersListCellModel) {
        avatarImageView.sd_setImage(with: model.avatarURL)
        nameLabel.text = model.nameText
        positionLabel.text = model.positionText
    }
}
