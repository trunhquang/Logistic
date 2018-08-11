

import UIKit

protocol DLNotifyParcelPopUpDelegate: class {
  func proceedParcel(notification: DLNotification)
  func cancelParcel(notification: DLNotification)
  func later(notification: DLNotification)
}
class DLNotifyParcelPopUp: UIView {

  @IBOutlet weak var senderAvatarIma: UIImageView!
  @IBOutlet weak var senderNameLab: UILabel!
  @IBOutlet weak var timeLab: UILabel!
  @IBOutlet weak var messageLab: UILabel!
  @IBOutlet weak var confirmRatingButton: UIButton!

  weak var delegate: DLNotifyParcelPopUpDelegate?
  var notification: DLNotification? = nil
  
  private let widthWithRatio: CGFloat = 300.0
  private let defaultHeight: CGFloat = 238.0

  override func awakeFromNib() {
    super.awakeFromNib()
//    confirmRatingButton.backgroundColor = MainColor.Gray
  }

  func configure(notification: DLNotification) -> CGFloat {
//    self.notification = notification
//
//    if notification.sendAvatar == "" {
//      senderAvatarIma.image = UIImage(named: "placeholder_profile")
//    } else {
//      senderAvatarIma.af_setImageWithURL(NSURL(string: notification.sendAvatar)!)
//    }
//    senderNameLab.text = notification.sendName
//    timeLab.text = notification.createdAt.mediumStyle()
//    messageLab.text = notification.message
//
//    return messageLab.requiredHeight() + 238.0 + 10.0
    return 100
  }

  @IBAction func proceedParcel(sender: UIButton) {
//    delegate?.proceedParcel(notification!)
  }

  @IBAction func cancelParcel(sender: UIButton) {
//    delegate?.cancelParcel(notification!)
  }

  @IBAction func later(sender: UIButton) {
//    delegate?.later(notification!)
  }

}
