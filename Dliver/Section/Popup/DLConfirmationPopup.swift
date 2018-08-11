

import UIKit

class DLConfirmationPopup: UIView {
  
  @IBOutlet weak var titleLabel: UILabel!
  
    var didConfirmButtonClicked: ((_ sender: AnyObject) -> Void)?
    var didCancelButtonClicked: ((_ sender: AnyObject) -> Void)?
  
  @IBOutlet weak var confirmButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    confirmButton.backgroundColor = MainColor.Gray
  }
  
  @IBAction func confirmClicked(sender: AnyObject) {
    if didConfirmButtonClicked != nil {
//      didConfirmButtonClicked!(sender: sender)
    }
  }
  
  @IBAction func cancelClicked(sender: AnyObject) {
    if didCancelButtonClicked != nil {
//      didCancelButtonClicked!(sender: sender)
    }
  }
}
