//
//  CreateNewParceHeaderView.swift
//  Dliver
//
//  Created by N&M on 8/11/18.
//  Copyright © 2018 N&M. All rights reserved.
//

import UIKit
protocol CreateNewParceHeaderViewDelegate {
    func didSelectButtonCaptureImage()
}
class CreateNewParceHeaderView: UIView {
    var delegate: CreateNewParceHeaderViewDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func captureImageAction(_ sender: Any) {
        delegate.didSelectButtonCaptureImage()
    }
}
