//
//  DLPickedUpViewController.swift
//  Dliver
//
//  Created on 7/20/16.
//

import UIKit


class DLPilotPickedUpViewController: DLPilotViewController {
  
  // Create confirmation popup
  lazy var confirmmationPopup: DLConfirmationPopup = {
    let popup = DLConfirmationPopup.loadNib()
    popup.titleLabel.text = NSLocalizedString("change_status_to_delivered", comment: "")
    
    popup.frame = CGRect(x: 0, y: 0, w: 300, h: 250)
    return popup
  }()
  
  lazy var ratingDialog: DLRatingDialog = {
    let dialog = DLRatingDialog.loadNib()
    dialog.frame = CGRect(x: 0, y: 0, width: 280.0, height: 296.0)
    return dialog
  }()
  
  var senderID: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    buttonAction.setTitle(NSLocalizedString("picker_up_screen", comment: "")
//      , forState: UIControlState.Normal)
//    statusParcel = DashboardParcelState.pickedUp
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func pickUpAction(sender: AnyObject) {
    
//    self.presentPopupView(confirmmationPopup)
    
    // Handle button action
//    confirmmationPopup.didCancelButtonClicked = {
//      (sender) in
//      self.dismissPopupView()
//    }
//
//    confirmmationPopup.didConfirmButtonClicked = {
//      (sender) in
//      self.showLoadding()
//      DLParcelAPI.pilotChangeStatus(self.offer.parcelID, pin: "", status: self.offer.status + 1, completeBlock: { (isResult, messageKey) in
//        if isResult {
//          Utils.delay(0.25, closure: {
//            self.showPopupNotify(messageKey, complete: {
//              self.delegate?.didPilotChangeStatusToPickUp(self.indexPath)
//              Utils.delay(0.25, closure: {
//                self.showRatingDialog()
//              })
//            })
//          })
//
//        } else {
//          self.showPopupNotify(messageKey)
//        }
//        self.hideLoadding()
//        self.dismissPopupView()
//
//      })
//    }
  }

  
  func showRatingDialog() {
//    ratingDialog.contentLab.text = String(format: NSLocalizedString("rating_content", comment: ""), offerDetail!.senderName, offerDetail!.senderName)
//    ratingDialog.ratingHandler = { ratingPoint in
//      self.dismissPopupView()
//      let accountID = DLCache.sharedCache.getObject(forKey: UserDefault.AccountID) as! String
//      let params = DLRatingParameter(senderID: self.offerDetail!.senderId, pilotID: accountID, parcelID: self.offerDetail!.parcelID, rate: ratingPoint, reviewType: 0)
//      DLParcelAPI.rating(params) { (result, message) in
//        Utils.delay(0.25, closure: {
//          self.showPopupNotify(message, complete: {
//            self.navigationController?.popViewControllerAnimated(true)
//          })
//        })
//      }
//    }
//    
//    ratingDialog.cancelHandler = {
//      self.dismissPopupView()
//      self.navigationController?.popViewControllerAnimated(true)
//    }
//    presentPopupView(ratingDialog)
  }
}
