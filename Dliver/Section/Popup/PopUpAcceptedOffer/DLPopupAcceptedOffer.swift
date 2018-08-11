
import UIKit

class DLPopupAcceptedOffer: UIView {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var acceptedOfferButton: UIButton!
  
    var didConfirmButtonClicked: ((_ sender: AnyObject) -> Void)?
    var didNoThanksButtonClicked: ((_ sender: AnyObject) -> Void)?
    var didLaterButtonClicked: ((_ sender: AnyObject) -> Void)?
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    acceptedOfferButton.backgroundColor = MainColor.Gray
  }
  
  @IBAction func confirmClicked(sender: AnyObject) {
    if didConfirmButtonClicked != nil {
//      didConfirmButtonClicked!(sender: sender)
    }
  }
  
  @IBAction func laterClicked(sender: AnyObject) {
    if didLaterButtonClicked != nil {
//      didLaterButtonClicked!(sender: sender)
    }
  }
  
  @IBAction func noThanksClicked(sender: AnyObject) {
    if didNoThanksButtonClicked != nil {
//      didNoThanksButtonClicked!(sender: sender)
    }
  }
}
