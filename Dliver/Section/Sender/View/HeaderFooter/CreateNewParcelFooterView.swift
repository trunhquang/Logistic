//
//  CreateNewParcelFooterView.swift
//  Dliver
//
//  Created by N&M on 8/11/18.
//  Copyright © 2018 N&M. All rights reserved.
//

import UIKit
protocol CreateNewParcelFooterViewDelegate {
    func didSelectButtonCreateNew()
}
class CreateNewParcelFooterView: UIView {
    var delegate: CreateNewParcelFooterViewDelegate!
    
    @IBAction func createNewAction(_ sender: Any) {
        delegate.didSelectButtonCreateNew()
    }
}
