//
//  String.swift
//  Dliver
//
//  Created by N&M on 8/2/18.
//  Copyright © 2018 N&M. All rights reserved.
//

import UIKit

extension String {
    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
