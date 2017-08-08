//
//  RegistrationJSONParser.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import SwiftyJSON
import ReactiveKit

struct RegistrationJSONParser {
  var error: NSError?
  
  init(_ json: JSON) {
    if let dict = json.dictionary, dict.count > 0 {
      error = NSError(fromJSON: json)
    }
  }
  
  func toSignal() -> Signal<Void, NSError> {
    return Signal<Void, NSError> { producer in
      if let error = self.error {
        producer.failed(error)
      } else {
        producer.completed(with: Void())
      }
      
      return NonDisposable.instance
    }
  }
}
