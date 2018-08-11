//
//  CreateParcelTypeTextViewTableViewCell.swift
//  Dliver
//
//  Created by N&M on 8/11/18.
//  Copyright © 2018 N&M. All rights reserved.
//

import UIKit

class CreateParcelTypeTextViewTableViewCell: UITableViewCell {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var icon: UIImageView!
    
    var model: CreateNewParcelModel!{
        didSet{
            icon?.image = UIImage(named: model.imageNAme)
            textView.text = model.placeHodelText
            textView.textColor = AppColors.GrayText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.delegate = self
    }
}

//MARK: - UITextViewDelegate
extension CreateParcelTypeTextViewTableViewCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == model.placeHodelText {
            textView.text = ""
            textView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""{
            textView.text = model.placeHodelText
            textView.textColor = AppColors.GrayText
        }
    }
}
