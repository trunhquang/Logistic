//
//  UITextField.swift
//  Dliver
//
//  Created by N&M on 7/7/18.
//  Copyright © 2018 N&M. All rights reserved.
//

import UIKit

extension UITextField {
    @IBInspectable var localizeKey: String {
        get {
            return ""
        } set {
            self.text = NSLocalizedString(newValue, comment: "")
        }
    }
    
    @IBInspectable var placeholderLocalizeKey: String {
        get {
            return ""
        } set {
            self.placeholder = NSLocalizedString(newValue, comment: "")
        }
    }
}
