//
//  DLAcceptedOfferViewController.swift
//  Dliver
//
//  Created on 7/20/16.
//

import UIKit

protocol DLPilotAcceptedOfferViewControllerDelegate {
  func didPilotCancelOffer(indexPath: NSIndexPath)
}

class DLPilotAcceptedOfferViewController: DLPilotViewController {
  
  var infoCart: DLCartInfoModel?
  var isForgot = false
  
  // Create confirmation popup
  lazy var confirmmationPopup: DLPopupAcceptedOffer = {
    let popup = DLPopupAcceptedOffer.loadNib()
    popup.frame = CGRect(x: 0, y: 0, w: 300, h: 250)
    return popup
  }()
  
  // Create confirmation popup
  lazy var confirmPaymentPopup: DLPopConfirmPayment = {
    let popup = DLPopConfirmPayment.loadNib()
    popup.frame = CGRect(x: 0, y: 0, w: 300, h: 360)
    return popup
  }()
  
  var delegateAcceptedOffer: DLPilotAcceptedOfferViewControllerDelegate?
  
  //MARK Function
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    buttonAction.setTitle(NSLocalizedString("accepted_offer_screen", comment: ""), forState: UIControlState.Normal)
//    statusParcel = DashboardParcelState.acceptedOffer
//
//    registerKeyboardNotifications()
  }
  
    override func viewWillAppear(_ animated: Bool) {
    //show popup after chang Pin
//    if isForgot{
//      isForgot = false
//      self.presentPopupView(self.confirmPaymentPopup)
//    }
  }
  
//  override func keyboardWillShow(frame: CGRect) {
//    UIView.animateWithDuration(0.25) {
//      self.confirmPaymentPopup.frame.origin.y = (Screen.HEIGHT - frame.height) - 10.0 - self.confirmPaymentPopup.frame.height
//    }
//  }
  
//  override func keyboardWillHide(frame: CGRect) {
//
//  }
  
  //override Action pickUp
  override func pickUpAction(sender: AnyObject) {
    //check  Infomation: mail, phone , Card
//    checkInfo { (cartInfo) in
//      self.infoCart = cartInfo
//      self.handlePopupProceedDeal()
//    }
  }
  
  private func handlePopupProceedDeal() {
    
//    confirmmationPopup.titleLabel.text = NSLocalizedString("popup_accepted_offer_title", comment: "")  + " " +
//      String.formatCurrency(infoCart!.price.doubleConverter, currencyCode: (infoCart?.currentCode)!)
//    presentPopupView(confirmmationPopup)
//    
//    // Handle button action
//    confirmmationPopup.didLaterButtonClicked = {
//      (sender) in
//      self.dismissPopupView()
//    }
//    
//    confirmmationPopup.didNoThanksButtonClicked = {
//      (sender) in
//      Utils.delay(0.25, closure: { 
//        self.cancelOffer()
//      })
//      self.dismissPopupView()
//    }
//    
//    confirmmationPopup.didConfirmButtonClicked = {
//      (sender) in
//      Utils.delay(0.25, closure: { 
//        self.showPaymentPopupConfirm()
//      })
//      self.dismissPopupView()
//    }
    
  }
  
  private func showPaymentPopupConfirm(){
//    confirmPaymentPopup.setData((infoCart?.price.doubleConverter)!, currencyCode: (infoCart?.currentCode)!, lastDigitCart: (infoCart?.lastDigit)!)
//
//    Utils.delay(0.25) {
//      self.presentPopupView(self.confirmPaymentPopup)
//    }
    
    confirmPaymentPopup.paymentBlock = { (pin) in
//      self.createPayment(pin)
//      self.dismissPopupView()
    }
    
    confirmPaymentPopup.cancelBlock = {
//      self.dismissPopupView()
    }
    confirmPaymentPopup.forgotBlock = {
//      self.dismissPopupView()
//      self.showChangePinScreen()
    }
  }
  
  private func showChangePinScreen() {
//    isForgot = true
//    let changePinVC = DLChangePinViewController.instantiateFromStoryboard(Storyboard.Information)
//    changePinVC.isAddPin = false
//    self.navigationController?.pushViewController(changePinVC, animated: true)
  }
  
  private func createPayment(pin: String){
//    self.showLoadding()
//    DLParcelAPI.pilotChangeStatus(self.offer.parcelID, pin: pin, status: self.offer.status + 1) { (isResult, key) in
//      if !isResult {
//        Utils.delay(0.25, closure: {
//          self.showPopupNotify(key)
//        })
//      } else {
//        self.pushTopaymentSuccessViewController()
//      }
//      self.hideLoadding()
//    }
  }
  
  private func pushTopaymentSuccessViewController() {
    
//    let paymentSuccessViewController = DLPaymentSuccessViewController(nibName: "DLPaymentSuccessViewController", bundle: nil)
//    paymentSuccessViewController.setData((self.infoCart?.price.doubleConverter)!, currencyCode: (self.infoCart?.currentCode)!, lastDigitCart: (self.infoCart?.lastDigit)!)
//    paymentSuccessViewController.doneBlock = {
//      self.delegate?.didPilotChangeStatusToPickUp(self.indexPath)
//      self.navigationController?.popViewControllerAnimated(true)
//    }
//    self.navigationController?.pushViewController(paymentSuccessViewController, animated: true)
  }
  
  private func cancelOffer(){
//    self.showLoadding()
//    DLParcelAPI.pilotCancelOffer(self.offer.parcelID, completeBlock: { (isResult, messageKey) in
//      if isResult {
//        self.showPopupNotify(messageKey, complete: {
//          if self.delegateAcceptedOffer != nil {
//            self.delegateAcceptedOffer?.didPilotCancelOffer(self.indexPath)
//            self.navigationController?.popViewControllerAnimated(true)
//          }
//        })
//      } else {
//        self.showPopupNotify(messageKey)
//      }
//      self.hideLoadding()
//    })
  }
  
  deinit {
//    removeKeyboardNotifications()
  }
}
