//
//  UIButton.swift
//  Dliver
//
//  Created by N&M on 7/7/18.
//  Copyright © 2018 N&M. All rights reserved.
//

import UIKit

extension UIButton {
    @IBInspectable var localizeKey: String {
        get {
            return ""
        } set {
            setTitle(NSLocalizedString(newValue, comment: ""), for: .normal)
        }
    }
}

