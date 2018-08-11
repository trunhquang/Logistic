
import UIKit
import GoogleMaps
import AlamofireImage

class DLBidPopupView: UIView {
    
    var didClickBidButton:(() -> Void)?
    var didClickCloseButton:(() -> Void)?
    var didClickZoomButton:(() -> Void)?
    var didTapViewSenderProfile:((_ senderID: String) -> Void)?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var parcelImageView: UIImageView! {
        didSet {
            if let image = parcelImageView.image {
                if image.size.height < image.size.width {
                    //self.parcelImageView.contentMode = .ScaleAspectFill
                }
                else{
                   //self.parcelImageView.contentMode = .ScaleAspectFit
                }
            }
        }
    }
    
    @IBOutlet weak var parcelDescriptionLabel: UILabel!
    @IBOutlet weak var parcelNameLabel: UILabel!
    @IBOutlet weak var pickupAddressLabel: UILabel!
    @IBOutlet weak var deliveryAddressLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var vehicleImageView: UIImageView!
    
    @IBOutlet weak var fullParcelImageView: UIImageView!
    @IBOutlet weak var bottomImageConstraintConstant: NSLayoutConstraint!
    @IBOutlet weak var mapsView: GMSMapView!
    
    @IBOutlet weak var bidButton: UIButton!
    var parcelInfo: DLParcelDetails! {
        didSet {
//            parcelDescriptionLabel.text = parcelInfo.parcelDescription
//            parcelNameLabel.text = parcelInfo.name + " "
//            pickupAddressLabel.text = parcelInfo.addressFrom + " "
//            deliveryAddressLabel.text = parcelInfo.addressTo + " "
//
//            weightLabel.text = String(format: "%.0f", parcelInfo.weight) + "kg"
//            distanceLabel.text = String(format: "%.1f", parcelInfo.distance/1000) + "km"
//            priceLabel.text = String.formatCurrency(parcelInfo.deliverMaxPrice, localeIdentifier: parcelInfo.localizeIdentifyCode)
//
//            // profile picture
//            let placeholderImage = UIImage(named: PlaceholderImageName.Profile)
//            loadImage(profileImageView, url: parcelInfo.senderAvatar, placeholder: placeholderImage)
//
//            // Fetch parcel image
//            if let parcelString = parcelInfo.parcelImages.first?.imgUrl {
//                let parcelPlaceholder = UIImage(named: PlaceholderImageName.Parcel)
//                loadImage(parcelImageView, url: parcelString, placeholder: parcelPlaceholder)
//            }
//
//            // fetch transport
//            let transportPlaceholder = UIImage(named: PlaceholderImageName.Transport)
//            loadImage(vehicleImageView, url: parcelInfo.transportTypeIcon, placeholder: transportPlaceholder)
        }
    }
    var parcelImageIsShowing: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bidButton.backgroundColor = AppColors.Gray
    }
    
    @IBAction func bidToDriver(sender: UIButton) {
        if didClickBidButton != nil {
            didClickBidButton!()
        }
    }
    
    @IBAction func closeBidView(sender: AnyObject) {
        if didClickCloseButton != nil {
            didClickCloseButton!()
        }
    }
    
    @IBAction func zoomParcelImage(sender: AnyObject) {
        if didClickZoomButton != nil {
            if let parcelString = parcelInfo.parcelImages.first?.imgUrl {
//                let parcelPlaceholder = UIImage(named: PlaceholderImageName.Parcel)
//                loadImage(fullParcelImageView, url: parcelString, placeholder: parcelPlaceholder)
            }
            didClickZoomButton!()
        }
    }
    
    @IBAction func viewSenderProfile(sender: AnyObject) {
        if didTapViewSenderProfile != nil {
//            didTapViewSenderProfile!(senderID: parcelInfo.senderId)
        }
        
    }
    
    // MARK: - Helper methods
    private func loadImage(imageView: UIImageView, url urlString: String, placeholder: UIImage?) {
        let profileURL = NSURL(string: urlString)
//        imageView.af_setImageWithURL(
//            profileURL!,
//            placeholderImage: placeholder
//        )
    }
    
    
}
