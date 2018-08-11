
import UIKit

class DLPopConfirmPayment: UIView {
  @IBOutlet weak var line1MarginTop: NSLayoutConstraint!
  @IBOutlet weak var labelMessageMarginTop: NSLayoutConstraint!
  @IBOutlet weak var labelAmountMarginBottom: NSLayoutConstraint!
  @IBOutlet weak var line2MarginTop: NSLayoutConstraint!
  @IBOutlet weak var labelTotalMarginTop: NSLayoutConstraint!
  @IBOutlet weak var balelTobePaidMarginTop: NSLayoutConstraint!
  @IBOutlet weak var labelCartMarginTop: NSLayoutConstraint!
  @IBOutlet weak var line3MarginTop: NSLayoutConstraint!
  @IBOutlet weak var buttonPayContrainsHeight: NSLayoutConstraint!

  @IBOutlet weak var labelAmount: UILabel!
  @IBOutlet weak var labelTotal: UILabel!
  @IBOutlet weak var labelCartNumber: UILabel!
  @IBOutlet weak var labelCartPrice: UILabel!
  @IBOutlet weak var textFieldEnterPin: UITextField!
  
    var paymentBlock:((_ pin: String) -> Void)?
  var forgotBlock:(() -> Void)?
  var cancelBlock:(() -> Void)?
  
  private var lastString = ""

  @IBOutlet weak var confirmPaymentButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    confirmPaymentButton.backgroundColor = MainColor.Gray
    configContrains()
//    textFieldEnterPin.addTarget(self, action: #selector(textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
  }
  
  private func configContrains() {
//    line1MarginTop.constant           *= RATIO.SCREEN_HEIGHT
//    labelMessageMarginTop.constant    *= RATIO.SCREEN_HEIGHT
//    labelAmountMarginBottom.constant  *= RATIO.SCREEN_HEIGHT
//    line2MarginTop.constant           *= RATIO.SCREEN_HEIGHT
//    labelTotalMarginTop.constant      *= RATIO.SCREEN_HEIGHT
//    balelTobePaidMarginTop.constant   *= RATIO.SCREEN_HEIGHT
//    labelCartMarginTop.constant       *= RATIO.SCREEN_HEIGHT
//    line3MarginTop.constant           *= RATIO.SCREEN_HEIGHT
//    buttonPayContrainsHeight.constant *= RATIO.SCREEN_HEIGHT
  }
  
    func textFieldDidChange(textField: UITextField) {
//      if textFieldEnterPin.text?.length == 4 {
//        lastString = textFieldEnterPin.text!
//      } else if textFieldEnterPin.text?.length > 4{
//        textFieldEnterPin.text = lastString
//      }
    }
  
  func setData(price: Double, currencyCode: String, lastDigitCart: String) {
//    let amount = String.formatCurrency(price, currencyCode: currencyCode)
//    labelAmount.text = amount
//    labelTotal.text = amount
//    labelCartPrice.text = amount
//    labelCartNumber.text = NSLocalizedString("popup_payment_confirm_cart", comment: "") + " " + lastDigitCart
  }
  
  @IBAction func payAction(sender: AnyObject) {
//    self.paymentBlock?(pin: textFieldEnterPin.text!)
  }
  @IBAction func cancelAction(sender: AnyObject) {
//    self.cancelBlock?()
  }
  @IBAction func fotgotAction(sender: AnyObject) {
//    self.forgotBlock?()
  }
}
