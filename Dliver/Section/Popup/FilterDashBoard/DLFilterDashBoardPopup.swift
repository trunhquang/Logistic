
import UIKit

class DLFilterDashBoardPopup: UIView {
//constraint
  @IBOutlet weak var lineViewMarginTop: NSLayoutConstraint!
  @IBOutlet weak var buttonOKHeight: NSLayoutConstraint!
  
  @IBOutlet weak var statusViewHeight: NSLayoutConstraint!
  @IBOutlet weak var statusViewMarginLeft: NSLayoutConstraint!
  @IBOutlet weak var statusViewMarginTop: NSLayoutConstraint!
  @IBOutlet weak var status2ViewMarginRight: NSLayoutConstraint!
  @IBOutlet weak var status3MarginTop: NSLayoutConstraint!
  @IBOutlet weak var status4Margintop: NSLayoutConstraint!
  
  
  @IBOutlet weak var statusImageHeight: NSLayoutConstraint!
  @IBOutlet weak var statusImageWidth: NSLayoutConstraint!

  @IBOutlet weak var buttonCheckWidth: NSLayoutConstraint!
  @IBOutlet weak var buttonCheckHeight: NSLayoutConstraint!
  
// var
  @IBOutlet weak var status1: UIButton!
  @IBOutlet weak var status2: UIButton!
  @IBOutlet weak var status3: UIButton!
  @IBOutlet weak var status4: UIButton!
  @IBOutlet weak var status5: UIButton!
  @IBOutlet weak var status6: UIButton!
  @IBOutlet weak var buttonOk: UIButton!
  
  @IBOutlet weak var status1LabelTitle: UILabel!
  @IBOutlet weak var status6View: UIView!
  
  var isShowAll = false {
    didSet {
//      buttonOk.backgroundColor = MainColor.Gray
//      showAll(isShowAll)
    }
  }
  var dismisPopupView :(() -> Void)!
  var statusSelected  :[Int]? {
    didSet {
      if status1 != nil {
        setChecked()
      }
    }
  }
  
    var okAction        :((_ statusSelect: [Int]?) -> Void)!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setContrains()
  }
  
//MARK: - Action
  @IBAction func isSelectStatus(sender: AnyObject) {
    
    // set status return
    if statusSelected![sender.tag - 1] == 0 {
      statusSelected![sender.tag - 1] = sender.tag
    } else {
      statusSelected![sender.tag - 1] = 0
    }
  }

  @IBAction func dismissPopupView(sender: AnyObject) {
    self.dismisPopupView()
  }
  
  @IBAction func okButtonClick(sender: AnyObject) {
    self.dismisPopupView()
//    okAction(statusSelect: statusSelected)
  }
  
  func setChecked() {
//    self.status1.selected = (self.statusSelected![0] != 0)
//    self.status2.selected = (self.statusSelected![1] != 0)
//    self.status3.selected = (self.statusSelected![2] != 0)
//    self.status4.selected = (self.statusSelected![3] != 0)
//    self.status5.selected = (self.statusSelected![4] != 0)
//    if statusSelected! .count == 6 {
//      self.status6.selected = (self.statusSelected![5] != 0)
//    }
  }
  
  private func setContrains() {
//    lineViewMarginTop.constant      *= RATIO.SCREEN_HEIGHT
//    buttonOKHeight.constant         *= RATIO.SCREEN_HEIGHT
//    statusViewHeight.constant       *= RATIO.SCREEN_HEIGHT
//    statusViewMarginLeft.constant   *= RATIO.SCREEN_WIDTH
//    statusViewMarginTop.constant    *= RATIO.SCREEN_HEIGHT
//    status2ViewMarginRight.constant *= RATIO.SCREEN_WIDTH
//    status3MarginTop.constant       *= RATIO.SCREEN_HEIGHT
//    status4Margintop.constant       *= RATIO.SCREEN_HEIGHT
//    statusImageHeight.constant      *= RATIO.SCREEN_HEIGHT
//    statusImageWidth.constant       *= RATIO.SCREEN_WIDTH
//    buttonCheckWidth.constant       *= RATIO.SCREEN_WIDTH
//    buttonCheckHeight.constant      *= RATIO.SCREEN_HEIGHT
  }
  
  private func showAll(isBool: Bool){
//    if isBool {
//      status6View.hidden = false
//      status1LabelTitle.text = DashboardParcelState(rawValue: 7)?.stateName
//      if statusSelected == nil {
//      statusSelected = [1,2,3,4,5,6]
//      }
//    } else {
//      status6View.hidden = true
//      status1LabelTitle.text = DashboardParcelState(rawValue: 1)?.stateName
//      if statusSelected == nil {
//        statusSelected = [1,2,3,4,5,0]
//      }
//    }
  }
}
