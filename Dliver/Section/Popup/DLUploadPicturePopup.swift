
import UIKit

class DLUploadPicturePopup: UIView {
  
  @IBOutlet weak var takePhoto: UIControl!
    typealias ConfigurePopUpBlock = (_ index:Int) -> Void
  var completeBlock: ConfigurePopUpBlock!
  
    init(completeBlock: @escaping ConfigurePopUpBlock){
        self.completeBlock = completeBlock
        super.init(frame: CGRect.zero)
        let popup = Bundle.main.loadNibNamed("DLUploadPicturePopup", owner: self, options: nil)?.first as?  UIView
        popup!.frame = CGRect(x: 0, y: 0, w: Screen.WIDTH * (600.0/750.0), h: Screen.HEIGHT * (370.0/1340.0))
        self.frame = popup!.frame
        self.addSubview(popup!)
        
    }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  //MARK: - Action Control
  @IBAction func takePhoto(sender: AnyObject) {
//    self.completeBlock(index: 0)
  }
  @IBAction func selectPhoto(sender: AnyObject) {
//    self.completeBlock(index: 1)
  }
  
  @IBAction func closePopup(sender: AnyObject) {
//    self.completeBlock(index: 2)
  }
  
  
}
