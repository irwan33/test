//
//  HomeViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/17/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit
import PageMenu
import MIFab

class MainViewController: UIViewController {
  
  static let reuseID = "MainViewController"
  var pageMenu : CAPSPageMenu?
  fileprivate var fab: MIFab!
 
  
 

    override func viewDidLoad() {
        super.viewDidLoad()
        pageMenuController()
        setupFab()

    }


  fileprivate func setupFab() {
    
    var fabConfig = MIFab.Config()
   
    fabConfig.buttonImage = UIImage(named: "start_fab_icon_xxxhdpi")
    fabConfig.buttonBackgroundColor = hexStringToUIColor(hex: "#EA703F")
   
     
    
    fab = MIFab(
      parentVC: self,
      config: fabConfig,
      options: [
        MIFabOption(
          title: "schedule stream",
          image: UIImage(named: "schedule_fab_icon"),
          backgroundColor: UIColor.blue,
          tintColor: UIColor.white,
          
          actionClosure: {
            let next:SetScheduleViewController = self.storyboard?.instantiateViewController(withIdentifier: "SetScheduleViewController") as! SetScheduleViewController
            self.navigationController?.pushViewController(next, animated: true)
            
        }
        ),
        MIFabOption(
          title: "stream now",
          image: UIImage(named: "schedule_fab_icon"),
          backgroundColor: UIColor.orange,
          tintColor: UIColor.white,
          actionClosure: {
            let next:StreamingViewController = self.storyboard?.instantiateViewController(withIdentifier: "StreamingViewController") as! StreamingViewController
            self.navigationController?.pushViewController(next, animated: true)
            
        }
        )
      ]
    )
    
    fab.showButton(animated: true)
    
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

extension MainViewController {
  func pageMenuController() {
    self.navigationController?.navigationBar.barTintColor = UIColor.white
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.barStyle = UIBarStyle.black
    self.navigationController?.navigationBar.tintColor = UIColor.white
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orange]
    
    
    // Initialize view controllers to display and place in array
    var controllerArray : [UIViewController] = []
    
    var viewControllerStoryboardId = "ViewController"
    let storyboardName = "Main"
    let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
//    let viewController1 = storyboard.instantiateViewController(withIdentifier: "SideMenu") as UIViewController!
//    viewController1?.title = "CATEGORIES"
//    controllerArray.append(viewController1!)
    
    
    
    let controller1 = storyboard.instantiateViewController(withIdentifier: "homeToCategory") as UIViewController!
    controller1?.title = "CATEGORIES"
    controllerArray.append(controller1!)
    
    let controller2 =  storyboard.instantiateViewController(withIdentifier: "FeatureViewController") as UIViewController!
    controller2?.title = "FEATURED"
    controllerArray.append(controller2!)
    
    let controller3 =  storyboard.instantiateViewController(withIdentifier: "FeatureViewController") as UIViewController!
    controller3?.title = "TRENDING"
    controllerArray.append(controller3!)
    
    let controller4 =  storyboard.instantiateViewController(withIdentifier: "FeatureViewController") as UIViewController!
    controller4?.title = "NEW"
    controllerArray.append(controller4!)
    
   
    
    // Customize menu (Optional)
    let parameters: [CAPSPageMenuOption] = [
      .scrollMenuBackgroundColor(UIColor.white),
      .viewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
      .selectionIndicatorColor(UIColor.orange),
      .addBottomMenuHairline(false),
      .menuItemFont(UIFont(name: "TitilliumWeb-Black", size: 45.0)!),
      .menuHeight(45.0),
      .selectionIndicatorHeight(0.0),
//      .menuItemWidthBasedOnTitleTextWidth(true),
      .selectedMenuItemLabelColor(UIColor.orange),
      .scrollAnimationDurationOnMenuItemTap(15),
      .centerMenuItems(true),
      
      
    ]
  
    pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 20.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
    
    
    pageMenu?.moveToPage(1)
    self.view.addSubview(pageMenu!.view)
    
      }
  
 
}

