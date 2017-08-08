//
//  ScheduleViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/25/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

  @IBOutlet weak var imageViewSchedule: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

      let mainImage = UIImage(named: "sample.jpg")
      imageViewSchedule.image = mainImage
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
