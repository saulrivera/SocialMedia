//
//  FancyTextView.swift
//  socialApp
//
//  Created by Saul Rivera on 8/22/17.
//  Copyright © 2017 Dymtech. All rights reserved.
//

import UIKit

class FancyTextView: UITextView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 2.0
    }

}
