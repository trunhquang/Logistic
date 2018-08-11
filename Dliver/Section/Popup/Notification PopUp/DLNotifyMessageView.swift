
import UIKit

class DLNotifyMessageView: UIView {
  
  @IBOutlet weak var senderIma: UIImageView!
  @IBOutlet weak var senderNameLab: UILabel!
  @IBOutlet weak var contentLab: UILabel!
  
  var didTapInNotificationView: ((String) -> Void)?
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    let tap = UITapGestureRecognizer(target: self, action: #selector(openNotificationScreenWithNotificationID(_:)))
//    addGestureRecognizer(tap)
  }
  
  var notification: DLNotification! {
    didSet {
//      senderIma.af_setImageWithURL(NSURL(string: notification.sendAvatar)!)
      senderNameLab.text = notification.sendName
      contentLab.text = notification.content
    }
  }
  
  func openNotificationScreenWithNotificationID(tap: UITapGestureRecognizer) {
    didTapInNotificationView?(notification.id)
  }
  
  @IBAction func closeView(sender: AnyObject) {
//    UIView.animateWithDuration(0.5, animations: {
//      self.transform = CGAffineTransformMakeTranslation(0, -64.0)
//    }) { result in
//      UIApplication.sharedApplication().statusBarHidden = false
//      self.removeFromSuperview()
//    }
  }
}
