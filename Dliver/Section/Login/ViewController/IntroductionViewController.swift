
import UIKit

class IntroductionViewController: UIViewController {
    var isKeepingLogin: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //DLCache.sharedCache.setObject(false, forKey: "shouldShowIntro")
    }
    
    @IBAction func closeDialogAndShowNext(_ sender: UIButton) {
        Util.setWellComeRootView()
    }
    
    //tag = 1 -> do not showAgain
    @IBAction func showChecked(sender: UIButton) {
        sender.tag = sender.tag == 1 ? 0 : 1
        let tag = sender.tag
        let image = tag == 0 ? UIImage(named: "deliver_checkbox") : UIImage(named: "deliver_checkbox_checked")
        sender.setImage(image, for: .normal)
        Cache.shared.setObject(obj: tag == 0, forKey: UserDetaultKey.showIntroduce)
    }
    
    @IBAction func closeDialog(sender: UIButton) {
    }
}
