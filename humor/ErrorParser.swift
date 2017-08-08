//
//  ErrorParser.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import SwiftyJSON
import ReactiveKit

struct ErrorParser {
  var error: NSError?
  let json: JSON
  
  init(_ json: JSON) {
    self.json = json
    for errorJSON in json["detail"].arrayValue {
      if let errorMessage = errorJSON.string, errorMessage == "Invalid token." {
        error = NSError(localizedDescription: errorMessage, code: .invalidToken)
        SavedData.shared.clear()
      }
    }
  }
  
  func toSignal() -> Signal<JSON, NSError> {
    if let error = error {
      return Signal<JSON, NSError>.failed(error)
    }
    return Signal<JSON, NSError>.just(json)
  }
  
  
}
