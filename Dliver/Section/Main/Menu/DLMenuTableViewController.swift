
import UIKit
import KYDrawerController

protocol DLMenuTableViewControllerDelegate {
  func didChooseMenuAtIndex(index: NSInteger)
}

class DLMenuTableViewController: UITableViewController {
  
  var delegate: DLMenuTableViewControllerDelegate?
  @IBOutlet weak var numberNotificationsLab: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.bounces = false
    self.tableView.alwaysBounceVertical = false
//    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(avatarDidChanged(_:)), name: "avatarDidChanged", object: nil)
//    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(handleNewGCMNotification(_:)), name: NotificationName.receiveNewNotification, object: nil)
//    // add header view
//    if let headerView = NSBundle.mainBundle().loadNibNamed("DLMenuHeaderView", owner: self, options: nil).first as?  DLMenuHeaderView {
//      headerView.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame) * (300.0 / 1330))
//      headerView.layoutIfNeeded()
//      headerView.userProfilePicture.layer.cornerRadius = CGRectGetWidth(headerView.userProfilePicture.frame)/2
//      headerView.userProfilePicture.clipsToBounds = true
//
//      if let userName = DLCache.sharedCache.getObject(forKey: UserDefault.UserName) as? String {
//        headerView.userNameLabel.text = userName
//      }
//        if let imgString = DLCache.sharedCache.getObject(forKey: UserDefault.Avatar) as? String, imgString.length > 0 {
//        let url = NSURL(string: imgString)
//        headerView.userProfilePicture.af_setImageWithURL(url!)
//      }
//      tableView.tableHeaderView = headerView
    }

  
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
//    let numNotification = DLNotificationRealmModel.shareInstance.numberOfNotifications()
//    numberNotificationsLab.hidden = numNotification == 0
//    numberNotificationsLab.superview!.hidden = numNotification == 0
//    numberNotificationsLab.text = "\(numNotification)"
  }
  
  func handleNewGCMNotification(notification: NSNotification) {
//    if view.window != nil {
//      let numNotification = DLNotificationRealmModel.shareInstance.numberOfNotifications()
//      numberNotificationsLab.hidden = numNotification == 0
//      numberNotificationsLab.superview!.hidden = numNotification == 0
//      numberNotificationsLab.text = "\(numNotification)"
//    }
  }
  
  // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 6
//    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if delegate != nil {
                delegate?.didChooseMenuAtIndex(index: indexPath.row)
            }
        tableView.deselectRow(at: indexPath, animated: true)
    }
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//    if delegate != nil {
//      delegate?.didChooseMenuAtIndex(indexPath.row)
//    }
//    tableView.deselectRowAtIndexPath(indexPath, animated: true)
//  }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
  // MARK: - Helper methos
  
  @objc private func avatarDidChanged(notification: NSNotification) {
//    if let headerView = tableView.tableHeaderView as? DLMenuHeaderView {
//      headerView.userNameLabel.text = DLCache.sharedCache.getObject(forKey: UserDefault.UserName) as? String
//        if let imgString = DLCache.sharedCache.getObject(forKey: UserDefault.Avatar) as? String, imgString.length > 0 {
//        let url = NSURL(string: imgString)
//        headerView.userProfilePicture.af_setImageWithURL(url!)
//      }
//      headerView.userNameLabel.text = DLCache.sharedCache.getObject(forKey: UserDefault.UserName) as? String
//    }
  }
  
  deinit {
//    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
}
