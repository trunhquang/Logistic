

import UIKit

class DLNotifyMessagePopUp: UIView {

  @IBOutlet weak var senderAvatarIma: UIImageView!
  @IBOutlet weak var senderNameLab: UILabel!
  @IBOutlet weak var timeLab: UILabel!
  @IBOutlet weak var messageLab: UILabel!
  @IBOutlet weak var clostButton: UIButton!
  @IBOutlet weak var containView: UIView!
  @IBOutlet weak var containWidth: NSLayoutConstraint!
  
    var closePopUpHandler: (() -> Void)!
  
  private let widthWithRatio: CGFloat = 300.0
  private let defaultHeight: CGFloat = 141.0
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    clostButton.backgroundColor = MainColor.Gray
//    containWidth.constant *= RATIO.SCREEN_WIDTH
  }
  
    func configurePopUp(senderAvatarURL: String, senderName: String, time: String, message: String, handler: () -> Void) {
    if senderAvatarURL == "" {
      senderAvatarIma.image = UIImage(named: "placeholder_profile")
    } else {
//      senderAvatarIma.af_setImageWithURL(NSURL(string: senderAvatarURL)!)
    }
    
    senderNameLab.text = senderName
    timeLab.text = time
    messageLab.text = message
//    closePopUpHandler = handler
  }
  
  @IBAction func closePopUp() {
    closePopUpHandler()
  }
}
