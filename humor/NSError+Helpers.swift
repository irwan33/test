//
//  NSError+Helpers.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit
import SwiftyJSON

enum ErrorType: Int {
  case genericError = 0
  case invalidToken
}

extension NSError {
  convenience init(localizedDescription: String, code: ErrorType = .genericError) {
    self.init(domain: "", code: code.rawValue, userInfo: [NSLocalizedDescriptionKey: localizedDescription])
  }
  
  convenience init(fromJSON json: JSON) {
    var errors = [String]()
    for (_, value) in json {
      if let errorMessages = value.arrayObject as? [String] {
        errors.append(contentsOf: errorMessages)
      }
    }
    self.init(localizedDescription: errors.joined(separator: "\n"))
  }
}
