//
//  Constant.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/4/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
  struct AppInfo {
    static let name = "humr"
  }
  
  struct Login {
    struct Animation {
      static let flashRepeatCount = 6
      static let flashDuration = 0.3
      static let moveDownDuration = 0.5
      static let moveUpDuration = 0.5
      static let moveUpY: CGFloat = -20
    }
  }
  
  struct Cell {
    struct Color {
      static let yellow = UIColor(hexString: "#F2F1CC")
    }
  }
  
  struct StatusBarNotification {
    static let duration: Double = 2
    struct Color {
      static let alertBackground = UIColor(red: 0.855, green: 0.2, blue: 0.176, alpha: 1)
      static let successBackground = UIColor(red: 0.188, green: 0.631, blue: 0.29, alpha: 1)
      static let text = UIColor.white
      static let yellowCell = UIColor(hexString: "#F2F1CC")
    }
  }
  
  struct Fonts {
    static let regular = "LATO-REG"
    static let bold = "LATO-BOL"
//    static let light = "Montserrat-Light"
//    static let semiBold = "Montserrat-SemiBold"
//    static let medium = "Montserrat-Medium"
//    static let thin = "Montserrat-Thin"
  }
}

