import UIKit
import DropDown

var phoneCode = ["1", "7", "20", "27", "30", "31", "32", "33", "34", "36", "39", "40", "41", "43", "44", "45", "46", "47", "48", "49", "51", "52", "53", "54", "55", "56", "57", "58", "60", "61", "62", "63", "64", "65", "66", "81", "82", "84", "86", "91", "92", "93", "94", "95", "98", "211", "212", "213", "216", "218", "220", "221", "222", "223", "224", "225", "226", "227", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "260", "261", "262", "263", "264", "265", "266", "267", "268", "269", "290", "291", "297", "298", "299", "350", "351", "352", "353", "354", "355", "356", "357", "358", "359", "370", "371", "372", "373", "374", "375", "376", "377", "378", "379", "380", "381", "382", "383", "385", "386", "387", "389", "420", "421", "423", "500", "501", "502", "503", "504", "505", "506", "507", "508", "509", "590", "590", "591", "592", "593", "595", "597", "598", "599", "670", "672", "673", "674", "675", "676", "677", "678", "679", "680", "681", "682", "683", "685", "686", "687", "688", "689", "690", "691", "692", "850", "852", "853", "855", "856", "880", "886", "960", "961", "962", "963", "964", "965", "966", "967", "968", "970", "971", "972", "973", "974", "975", "976", "977", "992", "993", "994", "995", "996", "998"]

protocol SignUpTableViewViewControllerDelegate: class {
  func openDliverTermScreen()
  func openPrivacyScreen()
}

class SignUpTableViewController: UITableViewController {

  // MARK: IBOulet
  @IBOutlet weak var firstNameTf: UITextField!
  @IBOutlet weak var lastNameTf: UITextField!
  @IBOutlet weak var emailTf: UITextField!
  @IBOutlet weak var phoneCodeBtn: UIButton!
  @IBOutlet weak var phoneNumberTf: UITextField!
  @IBOutlet weak var passwordTf: UITextField!
  @IBOutlet weak var confirmPasswordTf: UITextField!
  @IBOutlet weak var addressTf: UITextField!
  @IBOutlet weak var zipCodeTf: UITextField!
  @IBOutlet weak var conditionBtn: UIButton!
  @IBOutlet weak var signUpBtn: UIButton!
  @IBOutlet weak var conditionTv: UITextView!
  @IBOutlet weak var phoneCodeTextField: UITextField!


  @IBOutlet weak var countryTextField: UITextField!
  @IBOutlet weak var cityTextField: UITextField!


  weak var delegate: SignUpTableViewViewControllerDelegate?

  lazy var errorColor: UIColor = UIColor(red: 216/255, green: 27/255, blue: 40/255, alpha: 1.0)
  lazy var normalColor: UIColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
  var agreeCondition = true
  var erroMessage = "setting_alert_missing_information"
  var dropDown: DropDown! = DropDown()
  var countryDataSource = [String : String]()
  var cityDataSource = [String : String]()
  var currentTextfieldY = 0.0

//  let model = DLSignUpModel()
//  let params = DLSignupParams()

//  var listCountry: [DLCountry]? {
//    didSet {
//      if let countries = listCountry {
//        listCountryName.removeAll()
//        for (_, country) in countries.enumerate() {
//          listCountryName.append(country.name)
//        }
//      }
//    }
//  }
//  var listCity: [DLCity]? {
//    didSet {
//      if let cities = listCity {
//        listCityName.removeAll()
//        for (_, city) in cities.enumerate() {
//          listCityName.append(city.name)
//        }
//      }
//    }
//  }

  var listCountryName = [String]()
  var listCityName = [String]()

  //MARK: - System Method
  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    //signUpBtn.backgroundColor = MainColor.Green
//    dropDown.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1.0)
//    dropDown.direction = .Any
//    dropDown.topOffset = CGPoint(x: 0, y:-30.0)
//    dropDown.dismissMode = .OnTap
//    DropDown.startListeningToKeyboard()
//
//    tableView.rowHeight = UITableViewAutomaticDimension
//    tableView.estimatedRowHeight = 150.0
//
//    let tap = UITapGestureRecognizer(target: self, action: #selector(HandleTap(_:)))
//    conditionTv.addGestureRecognizer(tap)
//    setupConditionTextView()
//    self.addDoneButton()
//
//    // Get countryList
//    if let countries = DLCountryCityManager.sharedInstance.listCountry() {
//      listCountry = Array(countries)
//    }
  }
  //MARK: - Helper methods

//  private func showListCountry(textField: UITextField, aString: String) {
////    dropDown.hide()
//    cityTextField.text = ""
//    var dataSource = aString.length == 0 ? listCountryName : [String]()
//    if let countries = listCountry {
//      //this filter is same for loop
//      let _ = countries.filter({ (country) -> Bool in
//        if country.name.lowercaseString.containsString(aString.lowercaseString) {
//          self.countryDataSource[country.name] = country.id
//          dataSource.append(country.name)
//        }
//        return true
//      })
//      dropDown.anchorView = textField
//      dropDown.width = CGRectGetWidth(textField.frame)
//      dropDown.dataSource = dataSource
//      dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//        if let id = self.countryDataSource[item] {
//          self.params.country_id = id
//        }
//        else { // For select from arrow-down button
//          for (_, country) in countries.enumerate() {
//            if country.name == item {
//              self.params.country_id = country.id
//            }
//          }
//        }
//        textField.text = item
//        // Choose
//        if let cities = DLCountryCityManager.sharedInstance.listCitiesByCountryID(self.params.country_id) {
//          self.listCity = Array(cities)
//        }
//      }
//      dropDown.show()
//    }
//  }

//  private func showListCity(textField: UITextField, aString: String) {
//    if countryTextField.text == "" { return }
//    if let cities = listCity {
////      dropDown.hide()
//      var dataSource = aString.length == 0 ? listCityName : [String]() // listCityName for selection from arrow-down button
//      let _  = cities.filter({ (city) -> Bool in
//        if city.name.lowercaseString.containsString(aString.lowercaseString) {
//          self.cityDataSource[city .name] = city.id
//          dataSource.append(city.name)
//        }
//        return true
//      })
//      dropDown.anchorView = textField
//      dropDown.width = CGRectGetWidth(textField.frame)
//      dropDown.dataSource = dataSource
//      dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//        if let id = self.cityDataSource[item] {
//          self.params.city_id = id
//        }
//        else {
//          for (_, city) in cities.enumerate() {
//            if city.name == item {
//              self.params.city_id = city.id
//            }
//          }
//        }
//        textField.text = item
//      }
//      dropDown.show()
//    }
//  }

//  private func showListPhoneCode(aString: String) {
////    dropDown.hide()
//    var dataSource = aString.length == 0 ? phoneCode : [String]()
//    let _ = phoneCode.filter({ (code) -> Bool in
//      if code.containsString(aString) {
//        dataSource.append(code)
//      }
//      return true
//    })
//    dropDown.anchorView = phoneCodeTextField
//    dropDown.width = CGRectGetWidth(phoneCodeTextField.frame)
//    dropDown.dataSource = dataSource
//    dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//      self.phoneCodeTextField.text = "+" + item
//    }
//    dropDown.show()
//  }

  // MARK: IBAction
  @IBAction func showListPhoneCode(sender: UIButton) {
//    showListPhoneCode("")
  }

  @IBAction func showListCountry(sender: AnyObject) {
//    showListCountry(countryTextField, aString: "")
  }

  @IBAction func showListCity(sender: AnyObject) {
//    if let countries = listCountry {
//      for (_, country) in countries.enumerate() {
//        if country.name == countryTextField.text! {
//          self.params.country_id = country.id
//          if let cities = DLCountryCityManager.sharedInstance.listCitiesByCountryID(self.params.country_id) {
//            self.listCity = Array(cities)
//          }
//        }
//      }
//      showListCity(cityTextField, aString: "")
//    }
  }

  @IBAction func signUp(sender: UIButton) {
//    view.endEditing(true)
//    if !agreeCondition {
//      return
//    }
//
//    if validateFailed() {
//      showNotificationPopUp(erroMessage)
//      return
//    }
//
//    if invalidData() {
//      showNotificationPopUp(erroMessage)
//      return
//    }
//    self.showLoadding()
//    model.signUp(params) { resultMsg in
//      self.hideLoadding()
//      self.showNotificationPopUp(resultMsg)
//    }
  }

  @IBAction func checkCondition(sender: UIButton) {
//    agreeCondition = !agreeCondition
//    let imageName = agreeCondition ? "deliver_checkbox_checked" : "deliver_checkbox"
//    conditionBtn.setImage(UIImage(named: imageName), forState: .Normal)
//    signUpBtn.backgroundColor = !agreeCondition ? MainColor.Gray : MainColor.Green
  }

  // MARK: Method
  private func showNotificationPopUp(error: String) {
//    dismissPopupView()
//    Utils.delay(0.25) {
//      self.showPopupNotify(error)
//    }
  }

//  func addDoneButton() {
//    let keyboardToolbar = UIToolbar()
//    keyboardToolbar.sizeToFit()
//    let flexBarButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace,
//                                        target: nil, action: nil)
//    let doneBarButton = UIBarButtonItem(barButtonSystemItem: .Done,
//                                        target: view, action: #selector(UIView.endEditing(_:)))
//    doneBarButton.tintColor = MainColor.Green
//    keyboardToolbar.items = [flexBarButton, doneBarButton]
//    zipCodeTf.inputAccessoryView = keyboardToolbar
//  }

//  private func validateFailed() -> Bool {
//    var validateFailed = false
//    erroMessage = "setting_alert_missing_information"
//
//    guard let firstName = firstNameTf.text?._trim() else { return false }
//    if let errorLine = view.viewWithTag(firstNameTf.tag + 1) {
//      firstNameTf.text = firstName
//      errorLine.backgroundColor = firstName == "" ? errorColor : normalColor
//      if firstName == "" { validateFailed = true }
//      params.first_name = firstName
//    }
//
//    guard let lastName = lastNameTf.text?._trim() else { return false }
//    if let errorLine = view.viewWithTag(lastNameTf.tag + 1) {
//      lastNameTf.text = lastName
//      errorLine.backgroundColor = lastName == "" ? errorColor : normalColor
//      if lastName == "" { validateFailed = true }
//      params.last_name = lastName
//    }
//
//    guard let email = emailTf.text?._trim() else { return false }
//    if let errorLine = view.viewWithTag(emailTf.tag + 1) {
//      emailTf.text = email._trim()
//      errorLine.backgroundColor = email == "" ? errorColor : normalColor
//      if !email.isEmail { validateFailed = true }
//      params.email = email
//    }
//
//    guard let phoneNumber = phoneNumberTf.text else { return false }
//    if let errorLine = view.viewWithTag(phoneNumberTf.tag + 1) {
//      errorLine.backgroundColor = (phoneNumber == "" || phoneNumber.length < 7) ? errorColor : normalColor
//      let contain = phoneCode.contains({
//        (code) in
//        if phoneCodeTextField.text?.stringByReplacingOccurrencesOfString("+", withString: "") == code {
//          return true
//        } else {
//          return false
//        }
//      })
//      if let errorLine = view.viewWithTag(phoneCodeTextField.tag + 1) {
//        errorLine.backgroundColor = contain == false ? errorColor : normalColor
//      }
//      if (phoneNumber == "" || phoneNumber.length < 7 || contain == false) { validateFailed = true }
//      params.phone_number = phoneCodeTextField.text!.stringByReplacingOccurrencesOfString("+", withString: "") + " " + phoneNumber
//    }
//
//    guard let password = passwordTf.text?._trim() else { return false }
//    if let errorLine = view.viewWithTag(passwordTf.tag + 1) {
//      passwordTf.text = password
//      errorLine.backgroundColor = password == "" ? errorColor : normalColor
//      if password == "" { validateFailed = true }
//      params.password = password
//    }
//
//    guard let confirmPassword = confirmPasswordTf.text?._trim() else { return false }
//    if let errorLine = view.viewWithTag(confirmPasswordTf.tag + 1) {
//      confirmPasswordTf.text = confirmPassword
//      errorLine.backgroundColor = confirmPassword == "" ? errorColor : normalColor
//      if confirmPassword == "" { validateFailed = true }
//    }
//
//    guard let address = addressTf.text?._trim() else { return false }
//    if let errorLine = view.viewWithTag(addressTf.tag + 1) {
//      addressTf.text = address
//      errorLine.backgroundColor = address._trim() == "" ? errorColor : normalColor
//      if address._trim() == "" { validateFailed = true }
//      params.address = address
//    }
//
//    guard let zipCode = zipCodeTf.text?._trim() else { return false }
//    if let errorLine = view.viewWithTag(zipCodeTf.tag + 1) {
//      zipCodeTf.text = zipCode
//      errorLine.backgroundColor = zipCode == "" ? errorColor : normalColor
//      if zipCode == "" { validateFailed = true }
//      params.postal_code = zipCode
//    }
//
//    if params.country_id == "" {
//      validateFailed = true
//      if let errorLine = view.viewWithTag(countryTextField.tag + 1) {
//        errorLine.backgroundColor = errorColor
//      }
//    } else {
//      if let errorLine = view.viewWithTag(countryTextField.tag + 1) {
//        errorLine.backgroundColor = normalColor
//      }
//    }
//
//    if params.city_id == "" {
//      validateFailed = true
//      if let errorLine = view.viewWithTag(cityTextField.tag + 1) {
//        errorLine.backgroundColor = errorColor
//      }
//    } else {
//      if let errorLine = view.viewWithTag(cityTextField.tag + 1) {
//        errorLine.backgroundColor = normalColor
//      }
//    }
//    return validateFailed
//  }

//  private func invalidData() -> Bool {
//    if passwordTf.text!.length < 5 {
//      erroMessage = "signup_password_at_least_5_characters"
//      return true
//    }
//
//    if confirmPasswordTf.text! != passwordTf.text! {
//      erroMessage = "signup_password_not_match"
//      return true
//    }
//
//    if !emailTf.text!.isEmail || emailTf.text!.contains(" ") {
//      erroMessage = "popup_error_sender_email_incorrect_format"
//      return true
//    }
//
//    if firstNameTf.text!.length > 30 || lastNameTf.text!.length > 30 {
//      erroMessage = "setting_alert_missing_information"
//      return true
//    }
//
//
//
//    return false
//  }

  var attributedText: NSMutableAttributedString!
//  private func setupConditionTextView() {
//    let textToAttribute = conditionTv.text  // or "This is sample text"
//
//    let textToAttributeArray = textToAttribute.componentsSeparatedByString(" ")
//    attributedText = NSMutableAttributedString()
//
//    for word in textToAttributeArray {
//      let attributePending = NSMutableAttributedString(string: word + " ")
//      let myRange = NSRange(location: 0, length: word.characters.count)
//      let myCustomAttribute = [ "Tapped Word:": word]
//      if word == localizedString("signup_dliver") || word == localizedString("signup_terms") || word == localizedString("signup_of") || word == localizedString("signup_user") || word == localizedString("signup_privacy") || word == localizedString("signup_policy") {
//        attributePending.addAttributes([NSFontAttributeName : UIFont.boldSystemFontOfSize(13.0)], range: myRange)
//      }
//      attributePending.addAttributes(myCustomAttribute, range: myRange)
//      attributedText.appendAttributedString(attributePending) ///////
//
//    }
//    conditionTv.attributedText = attributedText // Add your attributed text to textview.
//
//  }

//  func HandleTap(sender: UITapGestureRecognizer) {
//
//    let myTextView = sender.view as! UITextView //sender is TextView
//    let layoutManager = myTextView.layoutManager //Set layout manager
//
//    var location = sender.locationInView(myTextView)
//    location.x -= myTextView.textContainerInset.left
//    location.y -= myTextView.textContainerInset.top
//
//    let characterIndex = layoutManager.characterIndexForPoint(location, inTextContainer: myTextView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
//
//    if characterIndex < myTextView.textStorage.length {
//      let attributeName = "Tapped Word:" //make sure this matches the name in viewDidLoad()
//      let attributeValue = attributedText.attribute(attributeName, atIndex: characterIndex, effectiveRange: nil) as? String
//      if let value = attributeValue {
//        if tappedDliverTerms(value) { gotoDliverTerm() }
//        if tappedPrivacy(value) { gotoPrivacy() }
//      }
//
//    }
//  }

//  private func localizedString(key: String) -> String {
//    return NSLocalizedString(key, comment: "")
//  }

//  private func tappedDliverTerms(word: String) -> Bool {
//    if word == localizedString("signup_dliver") || word == localizedString("signup_terms") || word == localizedString("signup_of") || word == localizedString("signup_user") {
//      return true
//    }
//
//    return false
//  }

//  private func tappedPrivacy(word: String) -> Bool {
//    if word == localizedString("signup_privacy") || word == localizedString("signup_policy") {
//      return true
//    }
//
//    return false
//  }

//  private func gotoDliverTerm() {
//    NSNotificationCenter.defaultCenter().postNotificationName("openDliverScreen", object: self)
//  }

//  private func gotoPrivacy() {
//    print("goto privacy")
//  }
}

// MARK: - UITextFieldDelegate

extension SignUpTableViewController: UITextFieldDelegate {

//  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
////    var text = textField.text! + string
//    var text = (textField.text as NSString?)?.stringByReplacingCharactersInRange(range, withString: string)
//    if textField == countryTextField { // Implement country text field delegate
//      showListCountry(textField, aString: text!)
//    }
//
//    if textField == cityTextField {
//      showListCity(textField, aString: text!)
//    }
//
//    if textField ==  firstNameTf || textField == lastNameTf {
//      if text!.length > Constants.maxNameLength {
//        return false
//      }
//    }
//
//    if textField == phoneCodeTextField {
//      text = text!.stringByReplacingOccurrencesOfString("+", withString: "") //
//      showListPhoneCode(text!)
//    }
//
//    if(string == "\n") {
//      textField.resignFirstResponder()
//      return false
//    }
//    if string == "" { // Delete case
//      return true
//    }
//
//    if textField.text!.length > 11 && (textField.isEqual(phoneNumberTf) || textField.isEqual(zipCodeTf)) {
//      return false
//    }
//
//    if Int64(string) == nil && (textField.isEqual(phoneNumberTf) || textField.isEqual(zipCodeTf) || textField.isEqual(phoneCodeTextField)) {
//      return false
//    }
//
//    return true
//  }

//  func textFieldDidBeginEditing(textField: UITextField) {
//    if textField == countryTextField {
//      textField.text = ""
//      cityTextField.text = ""
//      self.params.country_id = ""
//      self.params.city_id = ""
//    }
//    if textField == cityTextField {
//      textField.text = ""
//      self.params.city_id = ""
//    }
//  }

//  func textFieldDidEndEditing(textField: UITextField) {
//    dropDown.hide()
//    if textField == countryTextField {
//      if let country = self.countryDataSource[textField.text!] {
//        self.params.country_id = country
//        if let cities = DLCountryCityManager.sharedInstance.listCitiesByCountryID(self.params.country_id) {
//          self.listCity = Array(cities)
//        }
//      }
//      else { // For select from arrow-down button
//        if let countries = self.listCountry {
//          for (_, country) in countries.enumerate() {
//            if country.name == textField.text! {
//              self.params.country_id = country.id
//            }
//          }
//        }
//      }
//    } else if textField == cityTextField {
//      if let city = self.cityDataSource[textField.text!] {
//        self.params.city_id = city
//      }
//      else {
//        if let cities = listCity {
//          for (_, city) in cities.enumerate() {
//            if city.name == textField.text! {
//              self.params.city_id = city.id
//            }
//          }
//        }
//      }
//    }
//  }
}

extension SignUpTableViewController: UITextViewDelegate {

//  func textViewDidEndEditing(textView: UITextView) {
//    let currentOffset = tableView.contentOffset
//    UIView.setAnimationsEnabled(false)
//    tableView.beginUpdates()
//    tableView.endUpdates()
//    UIView.setAnimationsEnabled(true)
//    tableView.setContentOffset(currentOffset, animated: false)
//  }

}

//MARK: - Private method
extension SignUpTableViewController {
    private func configUI(){
        title = NSLocalizedString("wellcome_screen_sign_up", comment: "")
        navigationItem.leftBarButtonItem = BackBarButton(closure: {
            Util.setWellComeRootView()
        })
    }
}
