import Foundation
import UIKit
import KYDrawerController
import Toast_Swift
import MBProgressHUD

var isShowToast = false
private var isLoading = false

class Util {
    static let appdelegate = UIApplication.shared.delegate as! AppDelegate
    static let window = Util.appdelegate.window
    static let navigationController = Util.appdelegate.rootNavigationController
    
    static func showLoginFlow(){
        let isShowIntroduce: Bool = Cache.shared.getObject(forKey: UserDetaultKey.showIntroduce) ?? true
        if isShowIntroduce {
            let introduceVC = IntroductionViewController.instantiateFromStoryboard(storyboardName: StoryboardName.Login)
            Util.window?.rootViewController = introduceVC
        } else {
            let isLoginBefore: Bool = Cache.shared.getObject(forKey: UserDetaultKey.isLogin) ?? false
            if isLoginBefore {
                setDashBoardRootView()
                return
            }
            Util.setWellComeRootView()
        }
    }
    static  func setWellComeRootView(){
        let _ = HomeViewController(nibName: nil, bundle: nil)
        let vc = WellComeViewController.instantiateFromStoryboard(storyboardName: StoryboardName.Login)
        Util.window?.rootViewController = vc
    }
    static func setKYDrawerROotView(){
        let vc = KYDrawerController.instantiateFromStoryboard(storyboardName: StoryboardName.Home)
        Util.window?.rootViewController = vc
    }
    static func setDashBoardRootView(){
        
    }
    static func setLoginRootView(){
        let vc = LoginViewController.instantiateFromStoryboard(storyboardName: StoryboardName.Login)
        let naVC = UINavigationController(rootViewController: vc)
        Util.window?.rootViewController = naVC
    }
    static func setSignUpRootView(){
        let vc = SignUpTableViewController.instantiateFromStoryboard(storyboardName: StoryboardName.Login)
        let naVC = UINavigationController(rootViewController: vc)
        Util.window?.rootViewController = naVC
    }
    
    //MARK: - Thread
    static func delayMain(delay: Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    static func delayBackGround(delay: Double, closure:@escaping ()->()) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    static func mainThread(closure: @escaping () -> Void){
        DispatchQueue.main.async {
            closure()
        }
    }
    static func backGroundThread(closure: @escaping () -> Void){
        DispatchQueue.global(qos: .background).async {
            closure()
        }
    }
    
    static func getLocalizeString(key: String) -> String {
        return  NSLocalizedString(key, comment: "Chưa có localize")
    }
    
    static func showToast(message: String, location: CGPoint? = nil){
        guard !isShowToast else {
            return
        }
        let view_ = UIApplication.shared.keyWindow
        var height: CGFloat = 0
        if location == nil {
            height =  (view_?.h)! - 100
        } else {
            height = location!.y
        }
        view_?.makeToast(message, duration: 2, point: CGPoint(x: Screen.WIDTH / 2, y: height), title: nil, image: nil, style: ToastStyle.init()) { (bool) in
            isShowToast = false
        }
        isShowToast = true
    }
    
    //**************************************************************************/
    // MARK: - Loadding
    /**************************************************************************/
    static func showLoadding() {
        guard isLoading != true else{
            return
        }
        isLoading = true
        let view_ = UIApplication.shared.keyWindow
        MBProgressHUD.showAdded(to: view_!, animated: true)
    }
    
    static func hideLoadding() {
        let view_ = UIApplication.shared.keyWindow
        MBProgressHUD.hide(for: view_!, animated: true)
        isLoading = false
    }
    //*************************---Loadding---*****************************/
    
    /*{*********************************************************/
    //MARK:________________Thread_____________________
    /************************************************************/
    static func mainThread(complete: @escaping () -> Void){
        DispatchQueue.main.async {
            complete()
        }
    }
    static func mainThreadDelay(time: TimeInterval = 2, complete: @escaping () -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            complete()
        }
    }
    /***********************************************************}*/
}

