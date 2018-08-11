
import UIKit

class DLForgotPasswordView: UIView {

  @IBOutlet weak var buttonConfirm: UIButton!
  @IBOutlet weak var emailTextField: UITextField!
    var didChangePasswordButtonClicked:((_ email: String) -> Void)?
  @IBOutlet weak var wrongEmailLabel: UILabel!
  var didClosePopup:(() -> Void)?
  override func awakeFromNib() {
    super.awakeFromNib()
    emailTextField.delegate = self
//    buttonConfirm.backgroundColor = MainColor.Gray
  }
  @IBAction func closePopup(sender: AnyObject) {
    if didClosePopup != nil {
      didClosePopup!()
    }
  }

  @IBAction func changePinButtonTouch(sender: AnyObject) {
    // Check email is correct format
//    if self.emailTextField.text?.isEmail == false {
//      self.wrongEmailLabel.hidden = false
//      self.wrongEmailLabel.alpha = 0.0
//      UIView.animateWithDuration(0.25, animations: {
//        self.wrongEmailLabel.alpha = 1.0
//        }, completion: nil)
//      return
//    }
//    self.wrongEmailLabel.hidden = true
//    if didChangePasswordButtonClicked != nil {
//      didChangePasswordButtonClicked!(email: emailTextField.text!)
//    }
  }
}

extension DLForgotPasswordView: UITextFieldDelegate {
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//    if textField.text?.length != 0 {
//      wrongEmailLabel.hidden = true
//    }
    return true
  }
}
