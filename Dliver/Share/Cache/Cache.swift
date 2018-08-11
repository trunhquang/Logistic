
import UIKit

class Cache: NSObject {
    static let shared = Cache()
    private let userDefaults = UserDefaults()
    
    func setObject(obj: Any?, forKey key: String) {
        userDefaults.set(obj, forKey: key)
        userDefaults.synchronize()
    }
    
    func getObject<T>(forKey key: String) -> T? {
        return userDefaults.object(forKey: key) as? T
    }
}
