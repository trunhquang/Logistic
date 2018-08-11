
import UIKit

class WellComeViewController: UIViewController {
  @IBOutlet weak var buttonSignIn: UIButton!
  @IBOutlet weak var buttonSignUp: UIButton!
  @IBOutlet weak var buttonHeight: NSLayoutConstraint!
  @IBOutlet weak var marginBottomButtonSignUp: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
      config()
  }
  
  //MARK: - Private method
  private func config(){
    buttonSignIn.layer.cornerRadius  = buttonHeight.constant / 2
    buttonSignIn.clipsToBounds = true

    buttonSignUp.layer.cornerRadius  = buttonHeight.constant / 2
    buttonSignUp.clipsToBounds = true
    buttonSignUp.layer.borderColor   = AppColors.Green?.cgColor
    buttonSignUp.layer.borderWidth   = 1
  }
  
//MARK: - Action
  @IBAction func signInAction(sender: AnyObject) {
    Util.setLoginRootView()
  }
  @IBAction func signUpAction(sender: AnyObject) {
    Util.setSignUpRootView()
//    let loginVC = DLLoginSignUpViewController.instantiateFromStoryboard(Storyboard.Login)
//    loginVC.showSignIn = false
//    self.navigationController!.setViewControllers([loginVC], animated: false)
    
  }
}
