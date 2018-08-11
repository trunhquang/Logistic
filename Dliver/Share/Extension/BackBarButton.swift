//
//  BackBarButton.swift
//  CCIOS
//
//  Created by NTQuang on 3/2/17.
//  Copyright © 2017 ConcungLtd. All rights reserved.
//

import UIKit

class BackBarButton: UIBarButtonItem {
    
    var actionBlock:(() -> Void)!
    
    override init() {
        super.init()
        self.image = UIImage(named: "back_icon")
        self.action = #selector(backBarButtonClick(sender:))
        self.tintColor = .white
        self.target = self
    }
    init(closure: @escaping (() -> Void)) {
        super.init()
        self.image = UIImage(named: "back_icon")
        self.action = #selector(backBarButtonClick(sender:))
        self.tintColor = .white
        self.target = self
        self.actionBlock = closure
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Action
    @objc func backBarButtonClick(sender: UIBarButtonItem){
        if self.actionBlock != nil {
            actionBlock()
        }
    }
}
