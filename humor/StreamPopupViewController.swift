//
//  StreamPopupViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/27/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit
import ReactiveKit
import Bond
class StreamPopupViewController: UIViewController {

  @IBOutlet weak var stopBtn: UIButton!
  @IBOutlet weak var cancelBtn: UIButton!
  var onShowEndPublisher: (() -> Void)?
  var onCancel: (() -> Void)?
  
  
  @IBAction func cancel_stop(_ sender: UIButton) {
    
    self.removeFromParentViewController()
    self.view.removeFromSuperview()
    
  }
  
  @IBAction func stop_stream(_ sender: UIButton) {
    
    let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "VC1") as! ViewController
    
  }
  

  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
}


