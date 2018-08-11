import Foundation
import UIKit
import KYDrawerController

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
}
