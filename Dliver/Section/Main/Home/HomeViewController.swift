
import UIKit
//import GoogleMaps
import FBSDKLoginKit
//import ObjectMapper
import KYDrawerController
//import RealmSwift
//import Google

class HomeViewController: UIViewController {

//  @IBOutlet weak var mapsView: GMSMapView!
//  let locationManager = CLLocationManager()
  @IBOutlet weak var currentLocationView: UIView!
//  @IBOutlet weak var currentUserAddress: UILabel!
  @IBOutlet weak var placeTableView: UITableView!
  @IBOutlet weak var heightConstraintTableView: NSLayoutConstraint!
  @IBOutlet weak var notificationLabel: UILabel!
  @IBOutlet weak var searchTextField: UITextField!
//  var currentLocation: CLLocation?
//  var searchedPlaces = [DLGMPlace]()
  var ratingFilter: Int = 0
  var distanceFilter: Int = 0
  var radiusFilter: Int = 5
  private var drawer: KYDrawerController?
//  var selectedParcel: DLParcelDetails? // Ony != nil when select a pracel from map
  lazy var bidPopup: DLBidPopupView = {
    let view = DLBidPopupView.loadNib()
    view.frame = CGRect(x: 0, y: 0, w: 320, h: 520)
//    view.mapsView.userInteractionEnabled = false // enable scroll
    return view
  }()

  lazy var confirmmationPopup: DLConfirmationPopup = { // use for confirmation loging out
    let popup = DLConfirmationPopup.loadNib()
    popup.frame = CGRect(x: 0, y: 0, w: 300, h: 200)
    popup.layoutIfNeeded()
    return popup
  }()

  lazy var filterPopup: DLFilterParcelView = {
    let popup = DLFilterParcelView.loadNib()
    popup.frame = CGRect(x: 0, y: 0, w: 300, h: 300)
    popup.layoutIfNeeded()
    return popup
  }()

  var keyboardHeight: CGFloat = 0.0

//MARK: - System method
  override func viewDidLoad() {
    super.viewDidLoad()
//    sendParcelButton.backgroundColor = MainColor.Gray
//    locationManager.delegate = self
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    locationManager.distanceFilter = Maps.DistanceFilter // filter 11 Km
//    locationManager.requestWhenInUseAuthorization()
//    heightConstaintButtonSenaPackage.constant *= RATIO.SCREEN_HEIGHT
//
//    mapsView.delegate = self
//    mapsView.buildingsEnabled = false
//    mapsView.indoorEnabled = false
//
//    searchTextField.addTarget(self, action: #selector(HomeViewController.textFieldDidChange(_:)), forControlEvents: .EditingChanged)
//
    if let drawer = self.navigationController?.parent as? KYDrawerController {
      self.drawer = drawer
      self.drawer?.drawerWidth = Screen.WIDTH*2/3
      if let drawerMenu = drawer.drawerViewController as? DLMenuTableViewController {
        drawerMenu.delegate = self
      }
    }
//
//    // Register nib cell for tableview
//    placeTableView.registerNib(UINib.init(nibName: "DLPlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "DLPlaceTableViewCell")
//    self.registerKeyboardNotifications()
    /*
    if Utils.networkRechability() == false {
      // load bid place
      let parcels = realmDB.objects(DLParcelSummary.self)
      if let firstParcel = parcels.first {
        let location = CLLocationCoordinate2D(latitude: firstParcel.latitudeFrom.doubleConverter, longitude: firstParcel.longitudeFrom.doubleConverter)
        mapsView.camera = GMSCameraPosition(target: location, zoom: 13, bearing: 0, viewingAngle: 0)
      }

      for obj in parcels {
        // Create marker
        let alocation = CLLocationCoordinate2D(latitude: obj.latitudeFrom.doubleConverter, longitude: obj.longitudeFrom.doubleConverter)
        let placePicker = GMSMarker(position: alocation)
        placePicker.icon = UIImage(named: "home_location_blue")
        placePicker.map = self.mapsView
        placePicker.userData = obj
      }
    }
    */
  }
//
//  override func viewWillAppear(animated: Bool) {
//    super.viewWillAppear(animated)
//    UIApplication.sharedApplication().statusBarStyle = .LightContent
//  }
//
//  override func viewDidAppear(animated: Bool) {
//    super.viewDidAppear(animated)
//    currentLocationView.addingDropShadow()
//    if let drawer = self.navigationController?.parentViewController as? KYDrawerController {
//      drawer.screenEdgePanGestureEnabled = true
//    }
//  }
//
//  override func viewDidDisappear(animated: Bool) {
//    super.viewDidDisappear(animated)
//    if let drawer = self.navigationController?.parentViewController as? KYDrawerController {
//      drawer.screenEdgePanGestureEnabled = false
//    }
//  }
  
  // MARK: Handle button actions

  //This method cause Hard touch searchTextField
  @IBAction func inputCurrentLocation(sender: AnyObject) {
    searchTextField.becomeFirstResponder()
  }

  @IBAction func clearSearchText(sender: AnyObject) {
//    searchTextField.text = "" // Clear search text
//    notificationLabel.hidden = true
//    fetchNearbyPlaces("")
  }

  @IBAction func showFilter(sender: AnyObject) {
//    self.view.endEditing(true)
//    placeTableView.hidden = true
//    filterPopup.didClosePopup = {
//      () in
//      self.dismissPopupView()
//    }
//
//    filterPopup.didSearchParcel = {
//      (param) in
//      self.mapsView.clear()
//      self.searchTextField.text = ""
//      if let location = self.currentLocation {
//        // save filter params
//        self.ratingFilter = param.rating
//        self.distanceFilter = param.distance
//        self.radiusFilter = param.radius
//        param.latitude = String(format: "%.6f", location.coordinate.latitude)
//        param.longitude = String(format: "%.6f", location.coordinate.longitude)
//        self.fetchParcels(param)
//      }
//      else {
//        self.notificationLabel.alpha = 0.0
//        self.notificationLabel.text = NSLocalizedString("home_turn_on_your_location", comment: "")
//        UIView.animateWithDuration(0.25, animations: {
//          self.notificationLabel.hidden = false
//          self.notificationLabel.alpha = 1.0
//        })
//      }
//      self.dismissPopupView()
//    }
//
//    presentPopupView(filterPopup)
  }

  @IBAction func menuBurgerPressed(sender: AnyObject) {
    if let drawer = self.navigationController?.parent as? KYDrawerController {
        drawer.setDrawerState(.opened, animated: true)
        drawer.mainViewController.view.alpha = 0.5
        drawer.delegate = self
    }
  }


//  // MARK: Navigation
//  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    if segue.identifier == Segue.PushPlaceBidScreen {
//      let placeBidVC = segue.destinationViewController as! DLPlaceBidViewController
//      placeBidVC.parcelDetail = sender as? DLParcelDetails
//    }
//  }

//  override func keyboardWillShow(frame: CGRect) {
//    keyboardHeight = frame.size.height
//  }

    private func sendingNewParcel () {
        let vc = CreateNewParcelViewController.instantiateFromStoryboard(storyboardName: StoryboardName.Sender)
        navigationController?.pushViewController(vc, animated: true)
    }

  private func gotoDashboard() {
//    let dashboardVC = DLDashboardViewController.instantiateFromStoryboard(Storyboard.Dashboard)
//    self.navigationController?.pushViewController(dashboardVC, animated: true)
  }

  private func gotoSetting() {
//    let settingVC = DLSettingViewController.instantiateFromStoryboard(Storyboard.Information)
//    self.navigationController?.pushViewController(settingVC, animated: true)
  }

  private func gotoNotification() {
//    let notificationVC = DLNotificationViewController.instantiateFromStoryboard(Storyboard.Information)
//    self.navigationController?.pushViewController(notificationVC, animated: true)
  }

//  private func fetchParcels(param: DLGetListParcelParams) {
//    let listParcels = List<DLParcelSummary>()
//    self.showLoadding()
//    DLParcelAPI.getListParcel(param, completion: { (results, errorMessage) in
//      self.hideLoadding()
//      if errorMessage?.isExprireTokenKey() == true {
//        self.showPopupNotify(errorMessage)
//        return
//      }
//
//      if let response = results {
//        if response.parcels.count == 0 {
//          self.placeTableView.hidden = true
//          self.notificationLabel.alpha = 0.0
//          self.notificationLabel.text = NSLocalizedString("home_no_parcel_found", comment: "")
//          UIView.animateWithDuration(0.25, animations: {
//            self.notificationLabel.hidden = false
//            self.notificationLabel.alpha = 1.0
//          })
//          return
//        }
//        self.notificationLabel.hidden = true
//        for item in response.parcels {
//          listParcels.append(item)
//          // Create marker
//          let alocation = CLLocationCoordinate2D(latitude: item.latitudeFrom.doubleConverter, longitude: item.longitudeFrom.doubleConverter)
//          let placePicker = GMSMarker(position: alocation)
//          placePicker.icon = UIImage(named: "home_location_blue")
//          placePicker.map = self.mapsView
//          placePicker.userData = item
//        }
//      } else {
//        self.notificationLabel.alpha = 0.0
//        self.notificationLabel.text = NSLocalizedString(errorMessage!, comment: "")
//        UIView.animateWithDuration(0.25, animations: {
//          self.notificationLabel.hidden = false
//          self.notificationLabel.alpha = 1.0
//        })
//      }
//    })
//  }

  private func fetchNearbyPlaces(text: String) {
//    if text == "" {
//      placeTableView.hidden = true
//      return
//    }else {
//      placeTableView.hidden = false
//    }
//    searchedPlaces.removeAll()
//    UIApplication.sharedApplication().networkActivityIndicatorVisible = true
//    DLGoogleMapsService.autocomplete(withText: text) { (result) in
//      UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//      if let places = result {
//        if places.count == 0 {
//          self.placeTableView.hidden = true
//          self.notificationLabel.alpha = 0.0
//          self.notificationLabel.text = NSLocalizedString("home_address_not_found", comment: "")
//          UIView.animateWithDuration(0.25, animations: {
//            self.notificationLabel.hidden = false
//            self.notificationLabel.alpha = 1.0
//          })
//          return
//        }
//
//        for place in places {
//          self.searchedPlaces.append(place)
//        }
//        if self.searchedPlaces.count > 0 {
//          self.placeTableView.hidden = false
//          self.notificationLabel.hidden = true
//          self.heightConstraintTableView.constant = Screen.HEIGHT - self.keyboardHeight - 20.0 - CGRectGetMinY(self.placeTableView.frame)
//          self.placeTableView.reloadData()
//        }
//      } else {
//        self.notificationLabel.alpha = 0.0
//        self.notificationLabel.text = NSLocalizedString("home_get_place_error", comment: "")
//        UIView.animateWithDuration(0.25, animations: {
//          self.notificationLabel.hidden = false
//          self.notificationLabel.alpha = 1.0
//        })
//      }
//    }
  }
  
  deinit {
   // self.removeKeyboardNotifications()
  }


}
// MARK: CLLocationManagerDelegate
//extension HomeViewController: CLLocationManagerDelegate {
//
//  func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//    if status == .AuthorizedWhenInUse {
//      locationManager.startUpdatingLocation()
//      mapsView.myLocationEnabled = true
//      mapsView.settings.myLocationButton = true
//    }
//  }
//
//  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    if let location = locations.first {
//      if let current = currentLocation {
//        let distance = location.distanceFromLocation(current)
//        if distance >= 11.0 {
//          currentLocation = locations.last
//          updateLocationOnMaps(currentLocation!)
//        }
//      } else {
//        currentLocation = locations.last
//        updateLocationOnMaps(currentLocation!)
//      }
//    }
//
//  }
//
//  private func updateLocationOnMaps(newLocation: CLLocation) {
//    // When get user'location, call serviece
//    if let location = self.currentLocation {
//      self.mapsView.clear()
//      let param = DLGetListParcelParams(radius: self.radiusFilter, distance: distanceFilter, rating: ratingFilter, latitude: String(format: "%f", location.coordinate.latitude), longitude: String(format: "%f", location.coordinate.longitude))
//      self.fetchParcels(param)
//    }
//    mapsView.camera = GMSCameraPosition(target: newLocation.coordinate, zoom: 13, bearing: 0, viewingAngle: 0)
//
//    let geocoder = CLGeocoder()
//    geocoder.reverseGeocodeLocation(newLocation, completionHandler: { (placemarks, error) in
//      if let placemark = placemarks?[0] {
//        // Address dictionary
//        //                    print(placemark.addressDictionary)
//        var address = ""
//        // Location name
//        if let locationName = placemark.addressDictionary!["Name"] as? String {
//          address += locationName
//        }
//        // Street address
//        if let street = placemark.addressDictionary!["Thoroughfare"] as? String {
//          address += ", " + street
//        }
//        // City
//        if let city = placemark.addressDictionary!["City"] as? String {
//          address += ", " + city
//        }
//        // Country
//        if let country = placemark.addressDictionary!["Country"] as? String {
//          address += ", " + country
//        }
//        //                self.currentUserAddress.text = address
//        self.searchTextField.text = address
//      }
//    })
//  }
//}

// MARK: - KYDrawerControllerDelegate
extension HomeViewController: KYDrawerControllerDelegate {
    func drawerController(_ drawerController: KYDrawerController, stateChanged state: KYDrawerController.DrawerState) {
//    if state == .Closed {
//      if let drawer = self.navigationController?.parentViewController as? KYDrawerController {
//        drawer.mainViewController.view.alpha = 1.0
//      }
//    }
  }
}

// MARK: - GMSMapViewDelegate

//extension HomeViewController: GMSMapViewDelegate {
//
//  func mapView(mapView: GMSMapView, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
//    view.endEditing(true)
//    notificationLabel.hidden = true
//    placeTableView.hidden = true
//  }
//
//  func mapView(mapView: GMSMapView, didLongPressAtCoordinate coordinate: CLLocationCoordinate2D) {
//    mapView.clear()
//    let placePicker = GMSMarker(position: coordinate)
//    placePicker.icon = UIImage(named: "pin_location")
//    placePicker.map = self.mapsView
//    mapsView.selectedMarker = placePicker
//    Utils.reverseGeocodeCoordinate(coordinate) { (address) in
//      placePicker.title = address
//      self.searchTextField.text = address
//    }
//    let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
//    let param = DLGetListParcelParams(radius: self.radiusFilter, distance: distanceFilter, rating: ratingFilter, latitude: String(format: "%f", location.coordinate.latitude), longitude: String(format: "%f", location.coordinate.longitude))
//
//    fetchParcels(param)
//  }
//
//  func mapView(mapView: GMSMapView, idleAtCameraPosition position: GMSCameraPosition) {
//    //        reverseGeocodeCoordinate(position.target)
//  }
//
//  func mapView(mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
//    // Clear maps
//    bidPopup.mapsView.clear()
//    self.bidPopup.fullParcelImageView.hidden = true // hide full image by default
//    // Handle action for bid pop up view
//
//    bidPopup.didClickCloseButton = {
//      () in
//      if !self.bidPopup.fullParcelImageView.hidden {
//        self.bidPopup.fullParcelImageView.hidden = true
//        UIView.animateWithDuration(0.25, animations: {
//          self.bidPopup.fullParcelImageView.alpha = 0.0
//        })
//        return
//      }
//      self.dismissPopupView()
//    }
//
//    bidPopup.didClickZoomButton = {
//      () in
//      self.bidPopup.fullParcelImageView.hidden = !self.bidPopup.fullParcelImageView.hidden
//      self.bidPopup.fullParcelImageView.alpha = 0.0
//      UIView.animateWithDuration(0.25, animations: {
//        self.bidPopup.fullParcelImageView.alpha = 1.0
//      })
//    }
//
//    bidPopup.didTapViewSenderProfile = {
//      (senderID) in
//      let profileVC = DLProfileUserViewController.instantiateFromStoryboard(Storyboard.Information)
//      profileVC.accountID = senderID
//      profileVC.didViewSenderProfile = {
//        () in
//        self.presentPopupView(self.bidPopup)
//      }
//      self.dismissPopupView()
//      self.navigationController?.pushViewController(profileVC, animated: true)
//    }
//
//    // destination marker
//    if let selectedPlace = marker.userData as? DLParcelSummary {
//      let parcelId = selectedPlace.parcelID
//      self.showLoadding()
//      DLParcelAPI.getParcelDetail(parcelId, completion: { (parcelDetail, error) in
//        self.hideLoadding()
//        if error?.message.isExprireTokenKey() == true {
//          self.showPopupNotify(error?.message)
//          return
//        }
//        if error == nil {
//          self.bidPopup.didClickBidButton = {
//            () in
//            self.checkInfo({ (cartInfo) in
//              self.dismissPopupView()
//              let placeBidVC = DLPlaceBidViewController.instantiateFromStoryboard(Storyboard.Home)
//              self.selectedParcel = parcelDetail
//              placeBidVC.parcelDetail = self.selectedParcel
//              placeBidVC.didCreateOfferCompletion = {
//                (success) in
//                if success {
//                  // FIXME: implement saved bid
//                  //                try realmDB.write({
//                  //                  realmDB.add(selectedPlace)
//                  //                })
//                } else {
//                  self.presentPopupView(self.bidPopup)
//                }
//              }
//              self.navigationController?.pushViewController(placeBidVC, animated: true)
//            })
//          }
//
//          self.bidPopup.parcelInfo = parcelDetail
//          let coordinateFrom = CLLocationCoordinate2D(latitude: (parcelDetail?.latitudeFrom)!.doubleConverter, longitude: (parcelDetail?.longitudeTo)!.doubleConverter)
//          let coordinateTo = CLLocationCoordinate2D(latitude: (parcelDetail?.latitudeTo)!.doubleConverter, longitude: (parcelDetail?.longitudeTo)!.doubleConverter)
//
//          // Source marker
//          let sourceMarker = GMSMarker(position: coordinateFrom)
//          sourceMarker.icon = UIImage(named: "bid_parcel_pin_location")
//          sourceMarker.map = self.bidPopup.mapsView
//
//          // Destination marker
//          let destinationMarker = GMSMarker(position: coordinateTo)
//          destinationMarker.icon = UIImage(named: "bid_parcel_pin_location")
//          destinationMarker.map = self.bidPopup.mapsView
//
//          let bounds = GMSCoordinateBounds(coordinate: coordinateFrom, coordinate: coordinateTo)
//          self.bidPopup.mapsView.animateWithCameraUpdate(GMSCameraUpdate.fitBounds(bounds, withPadding: 50.0))
//
//          // create a path
//          DLGoogleMapsService.getDirection(sourceLocation: coordinateFrom, toLocation: coordinateTo) { (mPath, mInfo, mLocation) in
//            if let path = mPath {
//              let polyLine = GMSPolyline(path: path)
//              polyLine.strokeWidth = 3.0
//              polyLine.strokeColor = MainColor.Green
//              polyLine.map = self.bidPopup.mapsView
//            }
//            // create a marker at center
//            if let centerLocation = mLocation { // center location
//              let centerMarker = GMSMarker(position: centerLocation)
//              centerMarker.map = self.bidPopup.mapsView
//              centerMarker.title = String(format: "%.1f", (parcelDetail?.distance)!/1000) + "km"
//              centerMarker.icon = UIImage(named: "down-arrow")
//              self.bidPopup.mapsView.selectedMarker = centerMarker
//            } // end center location
//            // present popup
//            self.presentPopupView(self.bidPopup)
//          } // End get direction
//        } // end successfull case
//        else { // Error case
//          self.showPopupNotify("home_get_parcel_detail_error")
//        }
//      })
//    }
//    return nil
//  }
//}

// MARK: - DLMenuTableViewControllerDelegate
extension HomeViewController: DLMenuTableViewControllerDelegate {
  func didChooseMenuAtIndex(index: NSInteger) {
    if drawer != nil {
        drawer?.setDrawerState(.closed, animated: true)
    }
    switch index {
    case 0:
      sendingNewParcel()
    case 1:
      break
    case 2:
      gotoDashboard()
    case 3:
      gotoNotification()
    case 4:
      gotoSetting()
    case 5:
//      confirmmationPopup.didConfirmButtonClicked = {
//        (_) in
//        self.dismissPopupView()
//        // Perfom log out function
//        DLUserAPI.logout({ (success, message) in
//            Utils.delay(0.25, closure: {
//              if success || message?.isExprireTokenKey() == true {
//                self.showPopupNotify(message, complete: {
//                  // Clear all notification
//                  DLNotificationRealmModel.shareInstance.clearAllNotification()
//                  // delete facebook token
//                  FBSDKLoginManager().logOut()
//                  Utils.didExpiredToken()
//                })
//              } else {
//                self.showPopupNotify(message)
//              }
//          })
//        })
//      }
//
//      confirmmationPopup.didCancelButtonClicked = {
//        (_) in
//        self.dismissPopupView()
//      }
//      confirmmationPopup.titleLabel.text?.localize(withKey: "menu_warning_logout_message")
//      presentPopupView(confirmmationPopup)
        return
    default:
      print("Default")
    }
  }
}

// MARK: - UITextFieldDelegate

extension HomeViewController: UITextFieldDelegate {
  
  func textFieldDidChange(textField: UITextField){
//    notificationLabel.hidden = true
//    placeTableView.hidden = true
//    fetchNearbyPlaces(textField.text!)
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
//    textField.resignFirstResponder()
//    notificationLabel.hidden = true
    return true
  }

  func textFieldDidBeginEditing(textField: UITextField) {
//    notificationLabel.hidden = true
//    mapsView.clear()
  }

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return searchedPlaces.count
    return 0
  }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCellWithIdentifier("DLPlaceTableViewCell", forIndexPath: indexPath) as! DLPlaceTableViewCell
//    if searchedPlaces.count > 0 {
//      let place = searchedPlaces[indexPath.row]
//      cell.placeNameLabel.text = place.name
//      cell.placeAddressLabel.text = place.vicinity
//    }
//    return cell
    return UITableViewCell()
  }

//  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//    self.view.endEditing(true)
//    // Hide table view
//    tableView.hidden = true
//    if searchedPlaces.count > 0 {
//      let place = searchedPlaces[indexPath.row]
//      UIApplication.sharedApplication().networkActivityIndicatorVisible = true
//      DLGoogleMapsService.getPlaceDetail(placeId: place.placeId!, completion: { (location) in
//        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//        if let loc = location {
//          place.lat = loc.coordinate.latitude
//          place.lng = loc.coordinate.longitude
//          // Create marker
//          self.mapsView.clear()
//
//          let locationCoordinate = CLLocationCoordinate2D(latitude: place.lat, longitude: place.lng)
//          let placePicker = GMSMarker(position: locationCoordinate)
//          placePicker.icon = UIImage(named: "pin_location")
//          placePicker.title = place.vicinity!
//          placePicker.map = self.mapsView
//          self.mapsView.selectedMarker = placePicker
//
//          self.searchTextField.text = place.placeDescription!
//
//          // update location on maps
//          self.mapsView.camera = GMSCameraPosition(target: loc.coordinate, zoom: 12, bearing: 0, viewingAngle: 0)
//          // Fetch parcels nearby
//          let param = DLGetListParcelParams(radius: self.radiusFilter, distance: self.distanceFilter, rating: self.ratingFilter, latitude: String(format: "%f", loc.coordinate.latitude), longitude: String(format: "%f", loc.coordinate.longitude))
//
//          self.fetchParcels(param)
//        } else {
//          self.notificationLabel.alpha = 0.0
//          self.notificationLabel.text = NSLocalizedString("home_get_place_error", comment: "")
//          UIView.animateWithDuration(0.25, animations: {
//            self.notificationLabel.hidden = false
//            self.notificationLabel.alpha = 1.0
//          })
//        }
//      })
//    }
//  }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 50.0
  }
}
