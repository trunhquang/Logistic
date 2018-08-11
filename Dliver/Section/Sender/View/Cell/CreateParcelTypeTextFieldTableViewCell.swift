//
//  CreateParcelTypeTextFieldTableViewCell.swift
//  Dliver
//
//  Created by N&M on 8/11/18.
//  Copyright © 2018 N&M. All rights reserved.
//

import UIKit

class CreateParcelTypeTextFieldTableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var icon: UIImageView!
    
    var model: CreateNewParcelModel!{
        didSet{
            icon?.image = UIImage(named: model.imageNAme)
            textField.placeholder = model.placeHodelText
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
