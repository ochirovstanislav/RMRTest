//
//  UIImageExtension.swift
//  RMRTest
//
//  Created by stanislav on 14.02.2020.
//  Copyright © 2020 Ochirov Stanislav. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func round() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
    
}
