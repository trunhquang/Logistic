//
//  DLWaitingPickUpViewController.swift
//  Dliver
//
//  Created on 7/20/16.
//

import UIKit

class DLPilotWaitingPickUpViewController: DLPilotViewController {
  
  lazy var confirmmationPopup: DLConfirmationPopup = {
    let popup = DLConfirmationPopup.loadNib()
    popup.titleLabel.text = NSLocalizedString("confirm_to_awaiting_pickup_to_picked_up", comment: "")
    popup.frame = CGRect(x: 0, y: 0, w: 300, h: 250)
    return popup
  }()
  
//MARK: Function
  override func viewDidLoad() {
    super.viewDidLoad()
//    buttonAction.setTitle(NSLocalizedString("a_waiting_pick_up_screen_button_title", comment: ""), forState: UIControlState.Normal)
//    statusParcel = DashboardParcelState.awaitPickUp
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func pickUpAction(sender: AnyObject) {
//    presentPopupView(confirmmationPopup)
//    confirmmationPopup.didCancelButtonClicked = { (sender) in
//      self.dismissPopupView()
//    }
//    confirmmationPopup.didConfirmButtonClicked = { (sender) in
//      self.changeStatus()
//      self.dismissPopupView()
//    }
  }
  
  func changeStatus(){
//    self.showLoadding()
//    DLParcelAPI.pilotChangeStatus(self.offer.parcelID, pin: "", status: self.offer.status + 1, completeBlock: { (isResult, messageKey) in
//      if isResult {
//        self.showPopupNotify(messageKey, complete: {
//          if self.delegate != nil {
//            self.delegate?.didPilotChangeStatusToPickUp(self.indexPath)
//            self.navigationController?.popViewControllerAnimated(true)
//          }
//        })
//      } else {
//        self.showPopupNotify(messageKey)
//      }
//      self.hideLoadding()
//    })
  }
}
