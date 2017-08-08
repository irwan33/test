
/*
* EasySlide
* LeftMenuViewController
*
* Author: Nathan Blamirs
* Copyright © 2016 Nathan Blamires. All rights reserved.
*/

import UIKit
import ReactiveKit
import PKHUD
class LeftMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwiftySwitchDelegate  {
    @IBOutlet var cnstSwitchButtonLeading: NSLayoutConstraint!
    @IBOutlet var viewSwitch: UIView!
    @IBOutlet var viewFace: UIView!
  
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var nameDisplay: UITextField!
  
  @IBOutlet var cnstSwitchFacebookLeading: NSLayoutConstraint!
  @IBOutlet var viewSwitchFacebook: UIView!
  @IBOutlet var viewFacebook: UIView!
  
    @IBOutlet weak var swiftySwitch1: SwiftySwitch!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var socialView: UIView!
    @IBOutlet weak var TwitterOn: UIImageView!
    @IBOutlet weak var twitterOff: UIImageView!
  
    @IBOutlet weak var FacebookOn: UIImageView!
    @IBOutlet weak var FaceboookOff: UIImageView!
    fileprivate let viewModel = ProfileViewModel()
    var isHappy : Bool!
  
    override func viewDidLoad() {
      
        super.viewDidLoad()
          setUserInfo()
      
      
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
      
      self.socialView.layer.borderWidth = 1
      self.socialView.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
      
      self.TwitterOn.isHidden = true
      self.FacebookOn.isHidden = true
      
      setCornerRadius(viewSwitch, pixels: viewSwitch.frame.size.height/2)
      setCornerRadius(viewFace, pixels: viewFace.frame.size.height/2)
      setCornerRadius(TwitterOn, pixels: TwitterOn.frame.size.height/2)
      setCornerRadius(twitterOff, pixels: twitterOff.frame.size.height/2)
      
      setCornerRadius(viewSwitchFacebook, pixels: viewSwitchFacebook.frame.size.height/2)
      setCornerRadius(viewFacebook, pixels: viewFacebook.frame.size.height/2)
      setCornerRadius(FacebookOn, pixels: FacebookOn.frame.size.height/2)
      setCornerRadius(FaceboookOff, pixels: FaceboookOff.frame.size.height/2)
      
      
      //Gestures
      
      let gestureRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeRight))
      gestureRight.direction = UISwipeGestureRecognizerDirection.right
      self.viewSwitch.addGestureRecognizer(gestureRight)
      
      let gestureRightFB = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeRightFB))
      gestureRight.direction = UISwipeGestureRecognizerDirection.right
      self.viewFacebook.addGestureRecognizer(gestureRightFB)
      
      let gestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeft))
      gestureLeft.direction = UISwipeGestureRecognizerDirection.left
      self.viewSwitch.addGestureRecognizer(gestureLeft)
      
      let gestureLeftFB = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeftFB))
      gestureLeft.direction = UISwipeGestureRecognizerDirection.left
      self.viewFacebook.addGestureRecognizer(gestureLeftFB)
      
      let gestureTap = UITapGestureRecognizer(target: self, action: #selector(self.toggleSwipe))
      self.viewSwitch.addGestureRecognizer(gestureTap)
      
      let gestureTapFB = UITapGestureRecognizer(target: self, action: #selector(self.toggleSwipeFB))
      self.viewFacebook.addGestureRecognizer(gestureTapFB)
      
      
      self.beHappy(false)


  
      let switchArray = [swiftySwitch1]
      
      for eachSwitch in switchArray {
        eachSwitch?.delegate = self
      }
    }
  

  



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableCell")
        cell?.textLabel?.textColor = UIColor.orange
        switch indexPath.item {
            case 0: cell?.textLabel!.text = "Profile Settings" 
            case 1: cell?.textLabel!.text = "App Setting"
            case 2: cell?.textLabel!.text = "My Videos"
            case 3: cell?.textLabel!.text = "Help"
            case 4: cell?.textLabel!.text = "Logout"
            default: cell
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var viewController = UIViewController();
        
        // get the new view controller
        switch indexPath.item {
            case 0:
              viewController = storyboard.instantiateViewController(withIdentifier: "homeToCategory")
            case 1:
              viewController = storyboard.instantiateViewController(withIdentifier: "homeToCategory")
            case 2:
              viewController = storyboard.instantiateViewController(withIdentifier: "homeToCategory")
            case 3:
              viewController = storyboard.instantiateViewController(withIdentifier: "homeToCategory")
            case 4:
              SavedData.shared.clear()
              goToLogin()
              UserDefaults.standard.set(nil, forKey: "launchedBefore")
            default: viewController = storyboard.instantiateViewController(withIdentifier: "homeToCategory")
        }
        
        // present next view
      
    }
}

extension LeftMenuViewController {

  func setUserInfo(){
    self.viewModel.getProfile().observe { event in
      if case .failed(let error) = event {
        self.showAlertMessage(error.localizedDescription)
      } else if case .next(let user) = event{
        if user.reg_id == "" {
          self.nameDisplay.text = "@\(user.name_display)"
          self.userName.text = user.username
        } else {
          self.userName.text = user.username
        }
        
      }
      }.dispose(in: bag)
  }
  
  func goToLogin() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: LoginViewController.reuseID)
    self.present(controller, animated: true, completion: nil)
  }
  
  func valueChanged(sender: SwiftySwitch) {
    if sender.isOn {
      //code when switch is turned on
      print("SwiftySwitch \(sender.tag) turned on! :)")
    } else {
      //code when switch is turned off
      print("SwiftySwitch \(sender.tag)  turned off! :(")
    }
  }
  
  func toggleSwipe() {
    isHappy == false ? swipeRight() : swipeLeft()
  }
  
  func toggleSwipeFB() {
    isHappy == false ? swipeRightFB() : swipeLeftFB()
  }
  
  func swipeRight() {
    
    self.cnstSwitchButtonLeading.constant = 68;
    
    UIView.animate(withDuration: 0.5, animations: {
      self.beHappy(true)
      self.changeColor(self.hexStringToUIColor(hex: "#33ADED"))
      self.view.layoutIfNeeded()
      self.TwitterOn.isHidden = false
      self.twitterOff.isHidden = true
      
    })
  }
  
  func swipeRightFB() {
    
    self.cnstSwitchButtonLeading.constant = 68;
    
    UIView.animate(withDuration: 0.5, animations: {
      self.beHappy(true)
      self.changeColorFB(self.hexStringToUIColor(hex: "#507CBD"))
      self.view.layoutIfNeeded()
      self.FacebookOn.isHidden = false
      self.FaceboookOff.isHidden = true
    })
  }
  
  func swipeLeft() {
    self.cnstSwitchButtonLeading.constant = 1
    
    UIView.animate(withDuration: 0.5, animations: {
      self.beHappy(false)
      self.changeColor(UIColor.lightGray)
      self.view.layoutIfNeeded()
      self.TwitterOn.isHidden = true
      self.twitterOff.isHidden = false
      
    })
  }
  
  func swipeLeftFB() {
    self.cnstSwitchButtonLeading.constant = 1
    
    UIView.animate(withDuration: 0.5, animations: {
      self.beHappy(false)
      self.changeColorFB(UIColor.lightGray)
      self.view.layoutIfNeeded()
      self.FacebookOn.isHidden = true
      self.FaceboookOff.isHidden = false
    })
  }
  func changeColor(_ color : UIColor) {
    self.viewSwitch.backgroundColor = color
    
  }
  
  
  func changeColorFB(_ color : UIColor) {
    self.viewSwitchFacebook.backgroundColor = color
    
  }
  func beHappy(_ isHappy:Bool) {
    
    self.isHappy = isHappy
  }
  
  func setCornerRadius(_ view:UIView, pixels:CGFloat) {
    view.layer.cornerRadius = pixels
    view.clipsToBounds = true
  }
  
  
  
  func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
      cString.remove(at: cString.startIndex)
    }
    
    if ((cString.characters.count) != 6) {
      return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
}
