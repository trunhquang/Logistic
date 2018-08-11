//
//  DLWaitingPickupViewController.swift
//  Dliver
//
//  Created on 7/19/16.
//

import UIKit
import AlamofireImage
import Alamofire
import GoogleMaps

protocol DLPilotViewControllerDelegate {
  func didPilotChangeStatusToPickUp(indexPath: NSIndexPath)
}

class DLPilotViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var buttonAction: UIButton!
  
  @IBOutlet weak var buttonContrainsHeight: NSLayoutConstraint!
  
  var delegate: DLPilotViewControllerDelegate?
  var indexPath: NSIndexPath!
  var offer: DLParcelSummary! {
    didSet{
        getOfferDetail(offerID: offer.parcelID)
    }
  }
  
  var image: UIImage?
  var offerDetail: DLParcelDetails? {
    didSet {
      self.tableView.reloadData()
        getImageParcel(complete: { (image) in
        self.image = image
      })
    }
  }
//  var modelData :[DataType]? {
//    didSet{
//      if self.modelData != nil  {
//        self.tableView.reloadData()
//      }
//    }
//  }
  
  var isHidenButtonAction: Bool? {
    didSet{
      if isHidenButtonAction == true {
//        buttonAction.hidden = true
//        updateContrainTableView()
      }
    }
  }
//  var statusParcel = DashboardParcelState.awaitPickUp {
//    didSet{
//      self.title = NSLocalizedString((DashboardParcelState(rawValue: statusParcel.rawValue)?.stateName)!, comment: "")
//    }
//  }
  
  // Create show imageview
  lazy var showingImageViewPopup: DLShowImageView = {
    let imgView = DLShowImageView.loadNib()
    imgView.frame = Screen.BOUNDS
    return imgView
  }()
  
  //MARK: - - Method
    override func viewDidLoad() {
      super.viewDidLoad()
      buttonAction.backgroundColor = AppColors.Gray
//      self.tableView.registerNibForDashBoard()
//      self.createNavigationBar()
//      self.modelData = [.person, .option]
//      self.tableView.rowHeight = UITableViewAutomaticDimension
//      self.tableView.estimatedRowHeight = 100
//      self.tableView.separatorStyle = .None
      
      configButton()
  }
  
  func getOfferDetail(offerID: String) {
//    self.showLoadding()
//    DLParcelAPI.getOfferDetail(offerID) { (parcelDetail, error) in
//      self.hideLoadding()
//      if error == nil {
//        self.offerDetail = parcelDetail
//      } else {
//        self.showPopupNotify(error?.message)
//      }
//    }
  }
  
  //MARK: - PickUp Action
  @IBAction func pickUpAction(sender: AnyObject) {
    
  }

  private func configButton() {
//    buttonContrainsHeight.constant *= RATIO.SCREEN_HEIGHT
//    buttonAction.cornerRadius = buttonContrainsHeight.constant / 2
  }
  
  //Update contrain when button hiden
 private func updateContrainTableView() {
//    tableView.removeAllConstraints()
//    let top = NSLayoutConstraint(item: tableView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 0)
//    let left = NSLayoutConstraint(item: tableView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 0)
//    let bottom = NSLayoutConstraint(item: tableView, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: 0)
//    let right = NSLayoutConstraint(item: tableView, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1, constant: 0)
//    NSLayoutConstraint.activateConstraints([top, left, bottom, right])
  }
  
    private func getImageParcel(complete: (_ image: UIImage?) -> Void){
    // request image pre for presentation
    if offerDetail?.parcelImages.first?.imgUrl != nil {
//      Alamofire.request(.GET, (offerDetail?.parcelImages.first?.imgUrl)!)
//        .responseImage { response in
//          if let image = response.result.value {
//            complete(image: image)
//          } else {
//            complete(image: nil)
//          }
//      }
    }
  }
}

//MARK: UITableDataSource
extension DLPilotViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if offerDetail == nil {return 0}
//    return modelData!.count
        return 0
  }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
//    let type = modelData?[indexPath.row]
//
//    switch type! {
//    case .person:
//      let cell = tableView.dequeueReusableCellWithIdentifier(TableViewIdentifier.Dashboard.infoCell) as! DLParcelInfomationTableViewCell
//      cell.state = statusParcel
//      cell.delegate = self
//      if offerDetail != nil {
//        cell.parcelDetail = offerDetail
//      }
//      return cell
//    case .delivery:
//      let cell = tableView.dequeueReusableCellWithIdentifier(TableViewIdentifier.Dashboard.deliveryCell) as! DLDeliveryInfoTableViewCell
//      if offerDetail != nil {
//        cell.parcelDetail = offerDetail
//        cell.delegate = self
//      }
//      return cell
//    case .option:
//      let cell = tableView.dequeueReusableCellWithIdentifier(TableViewIdentifier.Dashboard.optionCell) as! DLDashboardOptionTableViewCell
//      cell.showUnderLine = !(modelData?.count == 3)
//      cell.delegate = self
//      cell.isShowing = (modelData?.count == 3)
//      return cell
    return UITableViewCell()
    }
//  }
}

//MARK: UITableViewDelegate
extension DLPilotViewController: UITableViewDelegate {
  
}

//MARK: DLDashboardOptionDelegate
//extension DLPilotViewController: DLDashboardOptionDelegate {
//  func showHide() {
////    if modelData?.count == 2 {
////      modelData?.insert(.delivery, atIndex: 1)
////    }else{
////      modelData?.removeAtIndex(1)
////    }
//  }
//  
//  func viewPicture() {
////    if offerDetail?.parcelImages.first?.imgUrl == nil {return}
////    if self.image != nil {
////      self.showingImageViewPopup.image = image
////      self.presentPopupView(self.showingImageViewPopup)
////    } else {
////      self.showLoadding()
////      getImageParcel({ (image) in
////        self.hideLoadding()
////        if image != nil {
////          Utils.delay(0.25, closure: {
////            self.showingImageViewPopup.image = image
////            self.presentPopupView(self.showingImageViewPopup)
////          })
////        } else {
////          Utils.delay(0.25, closure: {
////            self.showPopupNotify("popup_error_receive_name_screen_title")
////          })
////        }
////      })
////    }
////    self.showingImageViewPopup.didCloseImageView = { _ in
////      self.dismissPopupView()
////    }
//  }
//}

//MARK: DLParcelInfomationTableViewCellDelegate
//extension  DLPilotViewController: DLParcelInfomationTableViewCellDelegate {
//  func didSelectShowProfile() {
//    let profileViewController = DLProfileUserViewController.instantiateFromStoryboard(Storyboard.Information)
//    profileViewController.accountID = offerDetail?.senderId
//    self.navigationController?.pushViewController(profileViewController, animated: true)
//  }
//}
//
//// MARK: DLParcelDeliveryTableViewCell
//extension DLPilotViewController: DLDeliveryInfoTableViewCellDelegate {
//  func showMap() {
//    let mapVC = DLDashboardMapViewController.instantiateFromStoryboard(Storyboard.Dashboard)
//    mapVC.sourceLocation = CLLocationCoordinate2D(latitude: offerDetail!.latitudeFrom.doubleConverter, longitude: offerDetail!.longitudeFrom.doubleConverter)
//    mapVC.desLocation = CLLocationCoordinate2D(latitude: offerDetail!.latitudeTo.doubleConverter, longitude: offerDetail!.longitudeTo.doubleConverter)
//    self.navigationController?.pushViewController(mapVC, animated: true)
//  }
//}

