
import UIKit

class DLAlertPopUp: UIView {
  
  @IBOutlet weak var okButton: UIButton!
    var handler: (() -> Void)?
  
  @IBOutlet weak var alertContentLab: UILabel!
  
  var alertContent: String! {
    didSet {
      alertContentLab.text = alertContent
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    okButton.backgroundColor = MainColor.Gray
  }
  
  @IBAction func okTapped(sender: UIButton) {
//    handler?()
  }
}
