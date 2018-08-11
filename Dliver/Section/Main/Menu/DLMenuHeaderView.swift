
import UIKit

class DLMenuHeaderView: UIView {
  
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var userProfilePicture: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.backgroundColor = AppColors.Gray
  }
  
}
