
import UIKit

class DLNotificationPopup: UIView {
  
  @IBOutlet weak var confirmButton: UIButton!
  @IBOutlet weak var titleLabel: UILabel!
  
  // add another button for case notification pop up with 2 button
  @IBOutlet weak var confirmButton2: UIButton!
  @IBOutlet weak var confirmButton2HeightCons: NSLayoutConstraint!
  
  var shouldHideconfirmButton2 = true {
    didSet {
      confirmButton2HeightCons.constant = shouldHideconfirmButton2 ? 0 : 50.0
    }
  }
  
    var didClickContinueButton: ((_ sender: AnyObject) -> Void)?
    var didClickButton2: ((_ sender: AnyObject) -> Void)?
  
  @IBAction func continueButtonClicked(sender: AnyObject) {
    if didClickContinueButton != nil {
//      didClickContinueButton!(sender: sender)
    }
  }
  
  // add action for confirmButton2
  @IBAction func continueButton2Clicked(sender: AnyObject) {
//    didClickButton2?(sender: sender)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    confirmButton.backgroundColor = MainColor.Gray
//    confirmButton2.backgroundColor = MainColor.Green
  }
  
}
