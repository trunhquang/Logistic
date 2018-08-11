//
//  Temp.swift
//  Dliver
//
//  Created by N&M on 8/2/18.
//  Copyright © 2018 N&M. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift
import SwiftyJSON

class RESTResponse: Object, Mappable {
    
    //error status
     var statusCode = 0
    
    //error message
     var message = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
    }
}
class RESTParam: NSObject, Mappable {
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
    }
}

class DLParcelDetails: Object, Mappable {
    
   var parcelID: String = ""
   var senderId: String = ""
   var senderAvatar: String = ""
   var senderName = ""
   var senderFirstName = ""
   var senderLastName = ""
   var parcelTypeName = ""
   var parcelTypeIcon = ""
   var parcelTypeID = 0
   var transportTypeName = ""
   var transportTypeIcon = ""
   var transportTypeID = 0
   var receiverName = ""
   var receiverFirstName = ""
   var receiverLastName = ""
   var name = ""
   var addressFrom = ""
   var contactPhoneFrom = ""
   var emailFrom = ""
   var contactPhoneTo = ""
   var emailTo = ""
   var longitudeFrom = ""
   var latitudeFrom = ""
   var addressTo = ""
   var longitudeTo = ""
   var latitudeTo = ""
   var deliverTime = ""
   var parcelDescription = ""
   var deliverMaxPrice: Double = 0.0
   var localizeIdentifyCode = ""
   var weight = 0.0
   var distance: Double = 0
   var statusId: Int = 0
   var statusName = ""
    var parcelImages = List<DLImageResponse>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
     func mapping(map: Map) {

    }
    
}

class DLImageResponse: Object, Mappable {
    
     var imgUrl = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        imgUrl  <- map["imageUrl"]
    }
    
}

class DLListParcelOffers: Object, Mappable {
    
    var parcels = List<DLParcelSummary>()
    var offers = List<DLParcelSummary>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
     func mapping(map: Map) {
    
    }
    
}

class DLListParcel: Object, Mappable {
    
    var parcels = List<DLParcelSummary>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
     func mapping(map: Map) {
    }
    
}

class DLParcelSummary: Object, Mappable {
    
  var parcelID = ""
  var senderParcelID = ""
  var name = ""
  var addressFrom = ""
  var longitudeFrom = ""
  var latitudeFrom = ""
  var deliverTime = ""
  var deliverMaxPrice = 0.0
  var localizeIdentifyCode = ""
  var partnerName = ""
  var partnerAvatar = ""
  var status = 1
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
     
    }
    
}
class DLLoginParams: RESTParam {
  
   var email = ""
   var password = ""
   var deviceToken = ""
   var deviceType = "1"
  
   var fbId = ""
   var fbToken = ""
   var fbFirstName = ""
   var fbLastName = ""
   var fbEmail = ""
   var fbAvatar: NSData?
    
    convenience init(email: String, password: String, deviceToken: String) {
        self.init()
        self.email = email
        self.password = password
        self.deviceToken = deviceToken
    }
    
    convenience init(facebookEmail email: String, fbId: String, fbToken: String, deviceToken: String, deviceType: String, firstName: String, lastName: String, avatar: NSData) {
        self.init()
        self.deviceToken = deviceToken
        self.fbEmail = email
        self.fbFirstName = firstName
        self.fbLastName = lastName
        self.fbToken = fbToken
        self.fbId = fbId
        self.fbAvatar = avatar
    }
    
    override func mapping(map: Map) {
        self.email        <- map["email"]
        self.password     <- map["password"]
        self.deviceToken  <- map["device_token"]
        self.deviceType   <- map["device_type"]
        self.fbId         <- map["fb_id"]
        self.fbToken      <- map["fb_token"]
        self.fbFirstName  <- map["fb_firstname"]
        self.fbLastName   <- map["fb_lastname"]
        self.fbEmail      <- map["fb_email"]
        self.fbAvatar     <- map["fb_avatar"]
    }
    
}
class DLCreateOffer: RESTParam {
     var parcelID = ""
     var pickupTime = ""
     var deliveryTime = ""
     var bidPrice: Double = 0.0
     var offerDescription = "aaa"
    
    override init() {
        super.init()
    }
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    override func mapping(map: Map) {
        self.parcelID               <- map["parcel_id"]
        self.pickupTime             <- map["pickup_time"]
        self.deliveryTime           <- map["delivery_time"]
        self.bidPrice               <- map["bid_price"]
        self.offerDescription       <- map["description"]
    }
}
class DLCartInfoModel: Object, Mappable {
    
     var status          = false
     var lastDigit       = ""
     var currentCode     = ""
     var price           = ""
     var cardType        = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
     func mapping(map: Map) {
        status            <- map["data.accepted"]
        lastDigit         <- map["data.metadata.last4"]
        currentCode       <- map["data.currency_code"]
        price             <- map["data.fee"]
        cardType          <- map["data.metadata.brand"]
    }
}
class DLGetListParcelParams: RESTParam {
    
  var radius = 0
  var distance = 0
  var rating = 0
  var latitude = ""
  var longitude = ""
  var limit = 20
  var offset  = 0
  
    convenience init(radius: Int, distance: Int, rating: Int, latitude: String, longitude: String) {
        self.init()
        self.radius = radius
        self.distance = distance
        self.rating = rating
        self.latitude = latitude
        self.longitude = longitude
        self.limit = 20
        self.offset = 0
    }
    
    override func mapping(map: Map) {
        self.radius         <- map["radius"]
        self.distance       <- map["distance"]
        self.rating         <- map["rating"]
        self.latitude       <- map["latitude"]
        self.longitude      <- map["longitude"]
        self.limit          <- map["limit"]
        self.offset         <- map["offset"]
    }
    
}

class DLListParcelOffersParams: RESTParam {
    
     var offset = 0
     var limit = 20
    
    convenience init(offset: Int, limit: Int) {
        self.init()
        
        self.offset = offset
        self.limit = limit
    }
    
    override func mapping(map: Map) {
        self.offset                 <- map["ofset"]
        self.limit                  <- map["limit"]
    }
    
}

//create Offer
class DLCreateOfferParams: RESTParam {
    
     var parcelID = ""
     var descriptionOffer = "description"
     var pickupTime = "pickup_time"
     var bidPrice = 0.0
    
    convenience init(parcelID: String, descriptionOffer: String, pickupTime: String, bidPrice: Double) {
        self.init()
        
        self.parcelID = parcelID
        self.descriptionOffer = descriptionOffer
        self.pickupTime = pickupTime
        self.bidPrice = bidPrice
    }
    
    override func mapping(map: Map) {
        self.parcelID           <- map["parcel_id"]
        self.descriptionOffer   <- map["description"]
        self.pickupTime         <- map ["pickup_time"]
        self.bidPrice           <- map ["bid_price"]
    }
    
}

//update profile user
class DLUpdateProfileParams: RESTParam {
     var firstName   = ""
     var lastName    = ""
     var address     = ""
     var phone       = ""
     var postalCode  = ""
     var country_id  = ""
     var city_id     = ""
     var email       = ""
     var userAvatar: NSData?
     var fbId        = ""
     var fbToken     = ""
    
    convenience init(firstName: String, lastName: String, address: String, phone: String, postalCode: String, country: String, city: String, email: String, fbId: String, fbToken: String) {
        self.init()
        
        self.firstName  = firstName
        self.lastName   = lastName
        self.address    = address
        self.phone      = phone
        self.postalCode = postalCode
        self.country_id    = country
        self.city_id       = city
        self.email      = email
        self.fbId       = fbId
        self.fbToken    = fbToken
    }
    
    override func mapping(map: Map) {
        self.firstName     <- map["first_name"]
        self.lastName      <- map["last_name"]
        self.address       <- map["address"]
        self.phone         <- map["phone"]
        self.postalCode    <- map["postal_code"]
        self.country_id    <- map["country_id"]
        self.city_id       <- map["city_id"]
        self.email         <- map["email"]
        self.userAvatar    <- map["avatar"]
        self.fbId          <- map["fb_id"]
        self.fbToken       <- map["fb_token"]
    }
}

// Rating
class DLRatingParameter: RESTParam {
     var senderID    = ""
     var pilotID     = ""
     var parcelID    = ""
     var rate        = 0
     var reviewType  = 0
    
    convenience init(senderID: String, pilotID: String, parcelID: String, rate: Int, reviewType: Int) {
        self.init()
        
        self.senderID = senderID
        self.pilotID = pilotID
        self.parcelID = parcelID
        self.rate = rate
        self.reviewType = reviewType
    }
    
    override func mapping(map: Map) {
        self.senderID     <- map["sender_id"]
        self.pilotID      <- map["pilot_id"]
        self.parcelID     <- map["parcel_id"]
        self.rate         <- map["rate"]
        self.reviewType   <- map["review_type"]
    }
}

// Sign Up
class DLSignupParams: RESTParam {
   var first_name      = ""
   var last_name       = ""
   var address         = ""
   var email           = ""
   var phone_number    = ""
   var postal_code     = ""
   var password        = ""
   var country_id      = ""
   var city_id         = ""
    
    override func mapping(map: Map) {
        self.first_name     <- map["first_name"]
        self.last_name      <- map["last_name"]
        self.address        <- map["address"]
        self.phone_number   <- map["phone"]
        self.postal_code    <- map["postal_code"]
        self.country_id     <- map["country_id"]
        self.city_id        <- map["city_id"]
        self.email          <- map["email"]
        self.password       <- map["password"]
    }
}

class DLNotification: Object, Mappable {
 var id: String = ""
    var sendID: String = ""
    var sendName: String = ""
    var sendAvatar: String = ""
    var createdAt = NSDate()
    var offerID: String = ""
    var content: String = ""
    var isRead = false
    var notificationType: String = ""
    var accountID: String = ""
    var isDelete: Bool = false
    var time: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        id                <- map["id"]
        sendID            <- map["sender_id"]
        sendName          <- map["sender_name"]
        sendAvatar        <- map["sender_avatar"]
        offerID           <- map["offer_id"]
        notificationType  <- map["notification_id"]
        content           <- map["content"]
        time              <- map["createdAt"]
     
    }

    
    var message: String! {
        return self.content
    }
    
//    var type: NotificationType {
//        return NotificationType(rawValue: Int(notificationType)!)!
//    }
}


class DLNotificationReponse: Object, Mappable {
    var notifications = List<DLNotification>()
    var status: Int = 0
    var msg: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
     func mapping(map: Map) {
//        notifications     <- (map["data"], ListTransform<DLNotification>())
        status            <- map["status"]
        msg               <- map["message"]
    }
}

class DLNotificationRealmModel {
    private init() {}
    static let shareInstance = DLNotificationRealmModel()
    
    func getListNotification(completion: (() -> Void)? = nil) {
//        DLUserAPI.getListNotification { [weak self] (result, error) in
//            if error == nil {
//                do {
//                    //let lastestNotification = self!.lastestNotificationTime()
//
//                    if self == nil {
//                        return
//                    }
//                    let realm = try! Realm()
//                    try realm.write {
//                        for item in result! {
//                            if let _ = self?.notificationWithID(item.id) {
//                                // there is already have notification with this ID
//                            } else {
//                                realmDB.add(item, update: true)
//                            }
//                        }
//                    }
//
//                    NSNotificationCenter.defaultCenter().postNotificationName(NotificationName.receiveNewNotification, object: self) // post notificaiton to burger menu
//                    completion?()
//                } catch let error as NSError { print(error) }
//            }
//        }
    }
    
    func deleteNotification(notification: [DLNotification]) -> Bool {
//        do {
//            try realmDB.write {
//                for not in notification {
//                    realmDB.delete(not)
//                }
//            }
//
//        } catch let error as NSError {
//            print(error)
//            return false
//        }
//
        return true
    }
    
    func numberOfNotifications() -> Int {
//        guard let currentAccountID = DLCache.sharedCache.getObject(forKey: UserDefault.AccountID) as? String else {
//            return 0
//        }
//        let predicate = NSPredicate(format: "accountID = %@ and isDelete = false and isRead = false", currentAccountID)
//        let notifications = realmDB.objects(DLNotification.self).filter(predicate)
//        return notifications.count
        return 0
    }
    
    func lastestNotification() -> DLNotification? {
//        let currentAccountID = DLCache.sharedCache.getObject(forKey: UserDefault.AccountID) as! String
//        let predicate = NSPredicate(format: "accountID = %@", currentAccountID)
//        let notifications = realmDB.objects(DLNotification.self).filter(predicate).sorted("createdAt", ascending: false).first
//
//        if notifications == nil {
//            return nil
//        }
//
//        return notifications
        return DLNotification()
    }
    
    func notificationWithID(id: String) -> DLNotification? {
//        let currentAccountID = DLCache.sharedCache.getObject(forKey: UserDefault.AccountID) as! String
//        let predicate = NSPredicate(format: "accountID = %@ AND id = %@", currentAccountID, id)
//        let notifications = realmDB.objects(DLNotification.self).filter(predicate).first
//
//        if notifications == nil {
//            return nil
//        }
//
//        return notifications
         return DLNotification()
    }
    
   // func listNotifications() -> Results<DLNotification>? {
//        let notifications = realmDB.objects(DLNotification.self)
//
//        if notifications.count <= 0 {
//            return nil
//        }
        
//        return Results<DLNotification()>
   // }
    
    func markAsRead(notification: DLNotification) -> Bool {
//        if notification.isRead {
//            return true
//        }
//
//        do {
//            try realmDB.write {
//                notification.isRead = true
//            }
//        } catch let error as NSError {
//            print(error)
//            return false
//        }
        
        return true
    }
    
    func markAsDelete(notification: [DLNotification]) -> Bool {
        
//        do {
//            try realmDB.write {
//                for not in notification {
//                    not.isDelete = true
//                }
//
//            }
//        } catch let error as NSError {
//            print(error)
//            return false
//        }
        
        return true
    }
    
    func clearAllNotification() {
//        do {
//            try realmDB.write({
//                let deleteNotifications = realmDB.objects(DLNotification)
//                realmDB.delete(deleteNotifications)
//            })
//        } catch let error as NSError {
//            print("delete notification error: \(error)")
//        }
    }
    
}



