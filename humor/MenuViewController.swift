//
//  MenuViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/19/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
  @IBOutlet weak var sharingView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

      self.sharingView.layer.borderWidth = 1
      self.sharingView.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
