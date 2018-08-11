

import UIKit
import IQKeyboardManagerSwift
import FacebookLogin
import KYDrawerController

class LoginViewController: UIViewController {
  
  @IBOutlet weak var emailText: UITextField!
  @IBOutlet weak var passwordText: UITextField!
  @IBOutlet weak var topPaddingConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var signInButton: UIButton!
//  lazy var forgotPasswordPopup: DLForgotPasswordView = {
//    let popup = DLForgotPasswordView.loadNib()
//    popup.frame = CGRectMake(0, 0, 300.0*RATIO.SCREEN_WIDTH, 195.0*RATIO.SCREEN_HEIGHT)
//    return popup
//  }()
  
//  var deviceToken: String {
//    return (DLCache.sharedCache.getObject(forKey: UserDefault.DeviceToken) ?? "defaultTokenNE") as! String
//  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        navigationItem.leftBarButtonItem = BackBarButton(closure: {
            Util.setWellComeRootView()
        })
        //    signInButton.backgroundColor = MainColor.Gray
//    topPaddingConstraint.constant = 60 * RATIO.SCREEN_HEIGHT
  }
  
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }

  
  deinit {
    //NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  @IBAction func forgotPassword(sender: AnyObject) {
    self.view.endEditing(true)
//    forgotPasswordPopup.didClosePopup = {
//      () in
//      self.dismissPopupView()
//    }
//    forgotPasswordPopup.didChangePasswordButtonClicked = {
//      (email) in
//      // Call api to reset passsowrd
//      self.showLoadding()
//      self.dismissPopupView()
//      DLUserAPI.resetPassword(email, completion: { (success, message) in
//        self.hideLoadding()
//        Utils.delay(0.25, closure: {
//          if success {
//            self.forgotPasswordPopup.emailTextField.text = ""
//          }
//          self.showPopupNotify(message)
//        })
//      })
    }
    
//    let popUpconfig = STZPopupViewConfig()
//    popUpconfig.dismissCompletion = {
//      (_) in
//      IQKeyboardManager.sharedManager().keyboardDistanceFromTextField = 0.0 // Reset the distance when dismiss keyboard
//    }
//    self.presentPopupView(self.forgotPasswordPopup, config: popUpconfig)
//    IQKeyboardManager.sharedManager().keyboardDistanceFromTextField = 70.0
//  }
  
  
func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)
    IQKeyboardManager.sharedManager().enable = false
    IQKeyboardManager.sharedManager().enableAutoToolbar = false
  }
  
  @IBAction func loginButtonPressed(sender: AnyObject) {
    self.view.endEditing(true) // Dismiss keyboard if it is showing
    Util.setKYDrawerROotView()
//    if passwordText.text?.isEmptyString() == true || emailText.text?.isEmail == false || passwordText.text?.length < 6 {
//      self.showPopupNotify("signin_password_email_not_match")
//      return
//    }
//    print(deviceToken)
//    let loginParams = DLLoginParams(email: emailText.text!, password: passwordText.text!, deviceToken: deviceToken)
//    self.showLoadding()
//    DLUserAPI.login(loginParams) { (result, error) in
//      self.hideLoadding()
//      if let userInfo = result {
//        self.loginSuccessfully(userInfo)
//      } else {
//        if let keyError = error?.message {
//          self.showPopupNotify(keyError)
//        }
//      }
//    }
  }
  
  @IBAction func loginWithFacebook(sender: AnyObject) {
    self.view.endEditing(true) // Dismiss keyboard if it is showing
//    let loginManager = FBSDKLoginManager()
//    loginManager.logInWithReadPermissions(["public_profile", "email"], fromViewController: self) { (result, error) in
//      if result != nil {
//        if result.isCancelled {
//          return
//        }
//        self.fetchUserFacebookInfo()
//      }
//    }
  }
  
//  private func fetchUserFacebookInfo() {
//    if let fbToken = FBSDKAccessToken.currentAccessToken().tokenString {
//      self.showLoadding()
//      let request = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email, picture.type(large)"])
//      request.startWithCompletionHandler({ (connection, result, error) in
//        self.hideLoadding()
//        if result != nil {
//          if let facebookInfo = Mapper<DLUserFacebookInfo>().map(result) {
//            // Download avatar's user
//            let request = RESTRequest(functionName: "", method: .GET, endcoding: .URL)
//            request.downloadFile(fromURLString: facebookInfo.avatarUrl, completion: { (path) in
//              if let data = NSData.init(contentsOfFile: path!) {
//                let params = DLLoginParams(facebookEmail: facebookInfo.email, fbId: facebookInfo.userId, fbToken: fbToken, deviceToken: self.deviceToken, deviceType: "1", firstName: facebookInfo.firstName, lastName: facebookInfo.lastName, avatar: data)
//                self.showLoadding()
//                DLUserAPI.login(params) { (result, error) in
//                  self.hideLoadding()
//                  if let userInfo = result {
//                    self.loginSuccessfully(userInfo)
//                  } else {
//                    if let keyError = error?.message {
//                      self.showPopupNotify(keyError)
//                    }
//                  }
//                } // End of login function
//              }
//            }) // Download user's avatar successfully
//          } // Login with facebook
//        }
//      })
//    }
//  }

//  private func loginSuccessfully(userInfo: DLUserInfo) {
//    // Cache user info
//    DLCache.sharedCache.saveUserInfo(userInfo)
//
//    // get User Notification
//    DLNotificationRealmModel.shareInstance.getListNotification()
//
//    // Clear password UITextField
//    passwordText.text = ""
//    let homeSB = UIStoryboard.init(name: Storyboard.Home, bundle: nil)
//    let homeVC = homeSB.instantiateViewControllerWithIdentifier("KYDrawerController")
//    self.navigationController?.pushViewController(homeVC, animated: true)
//  }
}

//MARK/: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}

extension LoginViewController {
    private func configUI(){
        title = NSLocalizedString("signin_with_email", comment: "")
    }
}
