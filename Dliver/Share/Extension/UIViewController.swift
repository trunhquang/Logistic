
import UIKit
extension UIViewController{
    class func instantiateFromStoryboard() -> Self {
        return instantiateFromStoryboardHelper(type: self, storyboardName: "Main")
    }
    
    class func instantiateFromStoryboard(storyboardName: String) -> Self {
        return instantiateFromStoryboardHelper(type: self, storyboardName: storyboardName)
    }
    
    private class func instantiateFromStoryboardHelper<T>(type: T.Type, storyboardName: String) -> T {
        var storyboardId = ""
        let components = "\(self)".components(separatedBy: ".")
        if components.count > 1
        {
            storyboardId = components[1]
        }
        else {
            storyboardId = components[0]
        }
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        
        return controller
    }
}
