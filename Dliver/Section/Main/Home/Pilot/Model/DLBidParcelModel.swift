//
//  DLDLBidParcelModel.swift
//  Dliver
//
//  Created on 7/21/16.
//

import UIKit

class DLBidParcelModel: NSObject {

  var title: String = ""
  var infomation: String = ""
  var infoKey: String = ""
  var imageSymbol: String = ""
  var isFirstTime: Bool = true

  init(title: String, infomation: String, infoKey: String, imgSymbol: String) {
    self.title = title
    self.infoKey = infoKey
    self.infomation = infomation
    self.imageSymbol = imgSymbol
  }

}
