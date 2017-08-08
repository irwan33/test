//
//  HUDManager.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/4/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit
import PKHUD

class HUDManager {
  class func showHUDActivity() {
    HUD.show(.systemActivity)
  }
  
  class func hideHUD() {
    HUD.hide()
  }
  
  class func showFlashHUD(message: String) {
    HUD.flash(.labeledError(title: "Humr Alert", subtitle: message), delay: 2.0)
  }
}

