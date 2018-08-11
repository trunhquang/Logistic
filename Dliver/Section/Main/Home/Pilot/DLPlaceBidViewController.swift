//
//  DLPlaceBidViewController.swift
//  Dliver
//
//  Created on 7/21/16.
//

import UIKit

class DLPlaceBidViewController: DLBaseViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var headerTableView: UIView!
  @IBOutlet weak var parcelImageView: UIImageView!
  @IBOutlet weak var createOfferButton: UIButton!
  
  var image: UIImage! {
    didSet {
//      if image.size.height < image.size.width {
//        self.parcelImageView.contentMode = .ScaleAspectFill
//      }
//      else{
//        self.parcelImageView.contentMode = .ScaleAspectFit
//      }
//      self.parcelImageView.image = image
    }
  }
  @IBOutlet weak var heightTableViewConstraint: NSLayoutConstraint!

  var parcelDetail: DLParcelDetails?
  var bidOffer = DLCreateOffer()
    var didCreateOfferCompletion:((_ success: Bool) -> Void)?
  private var listModels = [DLBidParcelModel]()

  lazy var showingImagePopup: DLShowImageView = {
    let popup = DLShowImageView.loadNib()
    popup.frame = CGRect(x: 0, y: 0, w: Screen.WIDTH, h: Screen.HEIGHT - 64)
    return popup
  }()

//  lazy var timeDialog: DLPickTimeDialog = {
//    let dialog = DLPickTimeDialog.loadNib()
//    dialog.frame = CGRectMake(0, 0, 300.0*RATIO.SCREEN_WIDTH, 390.0)
//    dialog.layoutIfNeeded()
//    return dialog
//  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    createOfferButton.backgroundColor = AppColors.Gray
    let backBarButton =  BackBarButton {
        if self.didCreateOfferCompletion != nil {
            self.didCreateOfferCompletion!(false)
        }
        self.navigationController?.popViewController(animated: true)
    }
    self.navigationItem.leftBarButtonItem = backBarButton
    title = NSLocalizedString("place_bid_title", comment: "")

    // Register cell nib
    tableView.register(UINib.init(nibName: "DLSentParcelTableViewCell", bundle: nil), forCellReuseIdentifier: "DLSentParcelTableViewCell")
    headerTableView.frame = CGRect(x: 0, y: 0, w: Screen.WIDTH, h: Screen.WIDTH/2)
    tableView.tableHeaderView = headerTableView
    
    // Init model
    initializeModel()
//
//    tableView.separatorStyle = .None
//    // assign parcel id
//    bidOffer.parcelID = (parcelDetail?.parcelID)!
//    fetchParcelImage(parcelImageView)
  }

  // MARK: - Handle button actions
  @IBAction func backToHomeScreen(sender: AnyObject) {

  }

  @IBAction func zoomParcelImage(sender: AnyObject) {
//    fetchParcelImage(showingImagePopup.parcelImageView)
//    if let parcelString = parcelDetail!.parcelImages.first?.imgUrl {
//      UIImage.imageWithUrl(parcelString, completeBlock: { (image) in
//        self.showingImagePopup.image = image
//      })
//    }
//    self.presentPopupView(showingImagePopup)
//    self.showingImagePopup.didCloseImageView = { _ in
//      self.dismissPopupView()
//    }
  }

  @IBAction func createOffer(sender: AnyObject) {
    // check input information
//    if bidOffer.bidPrice <= 0 || bidOffer.pickupTime.length == 0 || bidOffer.deliveryTime.length == 0 {
//      tableView.reloadData()
//      self.showPopupNotify("popup_error_receive_name_screen_message")
//      return
//    }
//    self.showLoadding()
//    DLParcelAPI.pilotCreateOffer(self.bidOffer) { (isResult, message) in
//      self.hideLoadding()
//      if isResult == true {
//        self.showPopupNotify("bid_parcel_confirm_title", keyButton: "common_continue_button", complete: {
//          // Save to Realm bidded parcel
//          if self.didCreateOfferCompletion != nil {
//            self.didCreateOfferCompletion!(success: true)
//          }
//          // Clear parcelDetail
//          self.parcelDetail = nil
//          self.navigationController?.popToRootViewControllerAnimated(true)
//        })
//      }
//      else {
//        self.showPopupNotify(message)
//      }
    
//    }



  }
  // MARK: - Helper methods
  
  private func fetchParcelImage(imgView: UIImageView) {
//    if let parcelString = parcelDetail!.parcelImages.first?.imgUrl {
//      UIImage.imageWithUrl(parcelString, completeBlock: { (image) in
//        self.image = image
//      })
//    }
  }

  private func compareDate(fromDate date: String, toDate otherDate: String) -> Bool {
//    if date.length == 0 || otherDate.length == 0 {
//      return false
//    }
//    let dateFormat = "yyyy-MM-dd HH:mm:ssZ"
//    let pickupTime = date.stringToDate(dateFormat: dateFormat)
//    let deliveryTime = otherDate.stringToDate(dateFormat: dateFormat)
//    let interval = pickupTime?.timeIntervalSinceDate(deliveryTime!)
//    if interval <= 60 { // tolerance 60'
//      return true
//    }
    return false
  }

  private func initializeModel() {
//    let myPriceModel = DLBidParcelModel(title: "place_bid_my_price", infomation: "", infoKey: "send_a_parcel_screen_info_price", imgSymbol: "sender_price")
//    let pickupTimeModel = DLBidParcelModel(title: "place_bid_pickup_time", infomation: "", infoKey: "add_time_screen_title", imgSymbol: "sender_time")
//    let deliveryTimeModel = DLBidParcelModel(title: "place_bid_delivery_time", infomation: "", infoKey: "add_time_screen_title", imgSymbol: "sender_time")
//    listModels.append(myPriceModel)
//    listModels.append(pickupTimeModel)
//    listModels.append(deliveryTimeModel)
    
//    heightTableViewConstraint.constant = Screen.WIDTH/2 + CGFloat(listModels.count)*50.0*RATIO.SCREEN_HEIGHT + Constants.STATUS_BAR_HEIGHT + Constants.NAVIGATION_BAR_HEIGHT
  }
  
  private func reloadCell(indexPath: NSIndexPath, model: DLBidParcelModel) {
//    model.infomation = model.infomation.length > 0 ? model.infomation : ""
//    self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DLPlaceBidViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return listModels.count
    return 0
  }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCellWithIdentifier(TableViewIdentifier.Sender.sendParcelCell) as! DLSentParcelTableViewCell
//    let model = listModels[indexPath.row]
//    cell.bidParcelModel = model
//    return cell
    return UITableViewCell()
  }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
    return 50
  }

//  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//    var selectedItem = listModels[indexPath.row]
//    switch indexPath.row {
//    case 0:
//      // My price
//      let priceVC = DLAddMaxPrice(nibName: "DLAddMaxPrice", bundle: nil)
////      priceVC.completeBlock = {(string, price) -> Void in
////        self.bidOffer.bidPrice = price
////        selectedItem.infomation = price > 0 ? string + String(format: "%.2f", price) : ""
////        self.reloadCell(indexPath, model: selectedItem)
////      }
//      priceVC.continueBlock = { (string, price) -> Void in
//        self.bidOffer.bidPrice = price
//        selectedItem.infomation = price > 0 ? string + String(format: "%.2f", price) : ""
//        self.reloadCell(indexPath, model: selectedItem)
//        if self.bidOffer.pickupTime.length > 0 {
//          return
//        }
//
//        let nextIndexPath = NSIndexPath(forRow: indexPath.row + 1, inSection: 0)
//        selectedItem = self.listModels[nextIndexPath.row]
//        self.timeDialog.daysHorizontalScroller.reload() // update content
//        self.timeDialog.centerIndex = 0 // reset center index
//        self.presentPopupView(self.timeDialog)
//        self.timeDialog.didClickContinueButton = {
//          (day) in
////          let info = self.compareDate(fromDate: currentDateString, toDate: day) == true ? day : ""
//          selectedItem.infomation = day.length > 0 ? day.formatDate() : ""
//          self.bidOffer.pickupTime = selectedItem.infomation
//          self.reloadCell(nextIndexPath, model: selectedItem)
//          self.dismissPopupView()
//        }
//      }
//      priceVC.parcelDetail = parcelDetail
//      priceVC.isFromBidPlaceScreen = true
//      priceVC.bidOffer = bidOffer
//      self.navigationController!.pushViewController(priceVC, animated: true)
//      break
//    case 1, 2:
//      timeDialog.daysHorizontalScroller.reload()
//      presentPopupView(timeDialog)
//      timeDialog.centerIndex = 0
//      timeDialog.didClickContinueButton = {
//        (day) in
//        self.dismissPopupView()  // close popup
//        if indexPath.row == 1 { // if have set delivery time
//          self.bidOffer.pickupTime = day.length > 0 ? day : ""
//          if self.bidOffer.deliveryTime.length > 0 {
//            if self.compareDate(fromDate: day, toDate: self.bidOffer.deliveryTime) == false {
//              self.bidOffer.pickupTime = ""
//            }
//          }
//        } else {
//          self.bidOffer.deliveryTime = day.length > 0 ? day : ""
//          if self.bidOffer.pickupTime.length > 0 { // if have set pickup time
//            if self.compareDate(fromDate: self.bidOffer.pickupTime, toDate: day) == false {
//              self.bidOffer.deliveryTime = ""
//            }
//          }
//        }
//        let pickUpInfo = self.bidOffer.pickupTime.length > 0 ? self.bidOffer.pickupTime.formatDate() : ""
//        let deliveryInfo = self.bidOffer.deliveryTime.length > 0 ? self.bidOffer.deliveryTime.formatDate() : ""
//        selectedItem.infomation = indexPath.row == 1 ? pickUpInfo : deliveryInfo
//        self.reloadCell(indexPath, model: selectedItem)
//      }
//    default:
//      print("not exist")
//    }
//    tableView.deselectRowAtIndexPath(indexPath, animated: true)
//  }

}
