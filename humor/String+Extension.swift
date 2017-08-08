//
//  String+Extension.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

extension String {
  func isEmail() -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
  }
  
  func getUsername() -> String {
    if let range = self.range(of: "@")?.lowerBound {
      return self.substring(to: range)
    }
    return ""
  }
}
