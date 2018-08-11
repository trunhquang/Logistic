import UIKit

class DLBaseViewController: UIViewController {
  var loadingIndicatorView: UIActivityIndicatorView!
  var containerView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    containerView = UIView(frame: CGRect(x: 0, y: 0, w: view.w, h: view.h))
    
    loadingIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    loadingIndicatorView.hidesWhenStopped = true
    loadingIndicatorView.color = AppColors.Gray
    loadingIndicatorView.center = containerView.center
    containerView.addSubview(loadingIndicatorView)
  }

  func startAnimating() {
    containerView.isUserInteractionEnabled = false
    view.addSubview(containerView)
    loadingIndicatorView.startAnimating()
    containerView.backgroundColor = UIColor.init(white: 0.0, alpha: 0.1)
  }

  func stopAnimating() {
    containerView.isUserInteractionEnabled = true
    loadingIndicatorView.stopAnimating()
    containerView.removeFromSuperview()
  }
}
