//
//  CreateNewParcelModel.swift
//  Dliver
//
//  Created by N&M on 8/11/18.
//  Copyright © 2018 N&M. All rights reserved.
//

import UIKit

enum CellType {
    case textField
    case textView
}
struct CreateNewParcelModel {
    var imageNAme: String!
    var type: CellType!
    var placeHodelText: String!
    var validMessageError: String!
    var isValid: Bool!
}
