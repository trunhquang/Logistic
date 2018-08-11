
import UIKit

class DLRatingDialog: UIView {
  
  @IBOutlet weak var contentLab: UILabel!
  @IBOutlet weak var ratingView: UIView!
  @IBOutlet weak var ratingButton: UIButton!
  
    var ratingHandler: ((Int) -> Void)!
    var cancelHandler: (() -> Void)!
  private var ratingPoint = 1
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    ratingButton.backgroundColor = MainColor.Gray
  }
  
  @IBAction func rating(sender: UIButton) {
    sender.isHighlighted = false
    let tag = sender.tag
    let checkedStar = tag / 10
    ratingPoint = checkedStar
    for i in 1..<6 {
      let star = ratingView.viewWithTag(i*10) as! UIButton
//      if i <= checkedStar {
//        star.setImage(UIImage(named: "rating_star_checked"), forState: .Normal)
//      } else {
//        star.setImage(UIImage(named: "rating_star_unchecked"), forState: .Normal)
//      }
    }
  }
  
  @IBAction func ratingButtonReleaser(sender: UIButton) {
//    sender.highlighted = false
  }
  
  @IBAction func ratingTapped(sender: UIButton) {
    ratingHandler(ratingPoint)
  }
  
  @IBAction func noThanksTapped(sender: UIButton) {
    cancelHandler()
  }
}
