//
//  SetScheduleViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/2/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

class SetScheduleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  @IBAction func stop_stream(_ sender: UIButton) {
    
    let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "VC1") as! ViewController
    
  }
}
