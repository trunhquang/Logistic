
import UIKit

class DLShowImageView: UIView {

  var image: UIImage! {
    didSet{
//      parcelImageView.rotationImageIfNeed(image)
    }
  }
  @IBOutlet weak var parcelImageView: UIImageView!
  
    var didCloseImageView: ((_ sender: AnyObject) -> Void)?

    @IBAction func closeImageView(sender: AnyObject) {
        if didCloseImageView != nil {
//            didCloseImageView!(sender: sender)
        }
    }
}
