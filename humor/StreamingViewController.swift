//
//  StreamingViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/27/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

class StreamingViewController: UIViewController {

    @IBOutlet weak var setTitle: UITextField!

  @IBOutlet weak var stopBtn: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        setTitle.placeHolderTextColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func showAlertButtonTapped(_ sender: UIButton) {
    
//    // create the alert
//    let alert = UIAlertController(title: "", message: "Do you want to stop streaming?", preferredStyle: UIAlertControllerStyle.alert)
//    
//    // add the actions (buttons)
//    alert.addAction(UIAlertAction(title: "stop", style: UIAlertActionStyle.default, handler: nil))
//    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
//    
//    // show the alert
//    self.present(alert, animated: true, completion: nil)
//  }
    
    let alertVc = self.storyboard?.instantiateViewController(withIdentifier: "StreamPopupViewController") as! StreamPopupViewController
    self.addChildViewController(alertVc)
    self.view.addSubview(alertVc.view)
    
  }
}




extension UITextField{
  @IBInspectable var placeHolderTextColor: UIColor? {
    set {
      let placeholderText = self.placeholder != nil ? self.placeholder! : "Input title"
      attributedPlaceholder = NSAttributedString(string:placeholderText, attributes:[NSForegroundColorAttributeName: newValue!])
    }
    get{
      return self.placeHolderTextColor
    }
  }
}
