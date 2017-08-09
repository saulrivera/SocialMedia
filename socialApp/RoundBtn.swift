//
//  RoundBtn.swift
//  socialApp
//
//  Created by Saul Rivera on 8/8/17.
//  Copyright © 2017 Dymtech. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        layer.cornerRadius = self.frame.width / 2
    }
    
}
