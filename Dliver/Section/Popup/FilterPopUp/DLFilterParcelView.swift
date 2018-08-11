
import UIKit

class DLFilterParcelView: UIView {

  @IBOutlet weak var radiusSlider: UISlider!
  @IBOutlet weak var tripLengthSlider: UISlider!
  @IBOutlet weak var searchButton: UIButton!

  var currentRadiusLabel: UILabel!
  var currentTripLengthLabel: UILabel!

  var didClosePopup:(() -> Void)?
    var didSearchParcel:((_ withParams: DLGetListParcelParams) -> Void)?

  private var lengthTripChecked: Bool = true
  private var ratingChecked: Bool = true
  private var ratingCount: Int = 0

  private let checkedImageName = "deliver_checkbox_checked"
  private let uncheckedImageName = "deliver_checkbox"

  override func awakeFromNib() {
    super.awakeFromNib()
//    searchButton.backgroundColor = MainColor.Gray
//    let thumbImage = UIImage(named: "filter_popup_thumb")
//    radiusSlider.setThumbImage(thumbImage, forState: .Normal)
//    radiusSlider.setThumbImage(thumbImage, forState: .Highlighted)
//    tripLengthSlider.setThumbImage(thumbImage, forState: .Normal)
//    tripLengthSlider.setThumbImage(thumbImage, forState: .Highlighted)
//
//    currentRadiusLabel = UILabel()
//    currentTripLengthLabel = UILabel()
//    currentRadiusLabel.font = MainFont.LightFont
//    currentTripLengthLabel.font = MainFont.LightFont
//    currentRadiusLabel.textColor = MainColor.Gray
//    currentTripLengthLabel.textColor = MainColor.Gray
//    currentRadiusLabel.textAlignment = .Center
//    currentTripLengthLabel.textAlignment = .Center
//
//    self.addSubview(currentRadiusLabel)
//    self.addSubview(currentTripLengthLabel)
//    
//    let length = Int(tripLengthSlider.value)
//    let radius = Int(radiusSlider.value)
//    currentTripLengthLabel.frame = CGRectMake(tripLengthSlider.frame.origin.x - 16, tripLengthSlider.frame.origin.y - 20, 50.0, 20.0)
//    currentRadiusLabel.frame = CGRectMake(radiusSlider.frame.origin.x - 16, radiusSlider.frame.origin.y - 20, 50.0, 20.0)
//    currentTripLengthLabel.text = String(format: "%dkm", length)
//    currentRadiusLabel.text = String(format: "%dkm", radius)
  }


  @IBAction func changeTripLength(sender: UISlider) {
    let length = Int(sender.value)
    if let imgView = sender.subviews.last { // imageView has size: 12.5x12.5
//      currentTripLengthLabel.frame = CGRectMake(sender.frame.origin.x + imgView.frame.origin.x - 16, sender.frame.origin.y - 20, 50.0, 20.0)
      currentTripLengthLabel.text = String(format: "%dkm", length)
    }
  }

  @IBAction func changeRadius(sender: UISlider) {
    let radius = Int(sender.value)
    if let imgView = sender.subviews.last { // imageView has size: 12.5x12.5
//      currentRadiusLabel.frame = CGRectMake(sender.frame.origin.x + imgView.frame.origin.x - 16, sender.frame.origin.y - 20, 50.0, 20.0)
      currentRadiusLabel.text = String(format: "%dkm", radius)
    }
  }

  @IBAction func closeFilter(sender: AnyObject) {
    if didClosePopup != nil {
      didClosePopup!()
    }
  }

  @IBAction func checkTripLength(sender: UIButton) {
//    lengthTripChecked = !lengthTripChecked
//    let imgNormal = UIImage(named: lengthTripChecked ? checkedImageName : uncheckedImageName)
//    sender.setImage(imgNormal, forState: .Normal)
  }

  @IBAction func checkRating(sender: AnyObject) {
//    ratingChecked = !ratingChecked
//    let imgNormal = UIImage(named: ratingChecked ? checkedImageName : uncheckedImageName)
//    sender.setImage(imgNormal, forState: .Normal)
  }

  @IBAction func rating(sender: UIButton) {
//    let starCheckedImageName = "info_star_checked"
//    let starUncheckedImageName = "info_star_uncheck"
//    let value = sender.tag
//    sender.highlighted = false
//    for i in 1...5 {
//      let star = self.viewWithTag(i) as! UIButton
//      if i <= value {
//        star.setImage(UIImage(named: starCheckedImageName), forState: .Normal)
//      } else {
//        star.setImage(UIImage(named: starUncheckedImageName), forState: .Normal)
//      }
//    }
//    ratingCount = sender.tag
  }


  @IBAction func searchParcels(sender: AnyObject) {
//    let radius = Int(radiusSlider.value)
//    let distance = lengthTripChecked ? Int(tripLengthSlider.value) : 0
//    let rating = ratingChecked ? ratingCount : 0
//    let params = DLGetListParcelParams(radius: radius, distance: distance, rating: rating, latitude: "0.0", longitude: "0.0")
//    if didSearchParcel != nil {
//      didSearchParcel!(withParams: params)
//    }
  }


}
