//
//  FieldsValidator.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import Foundation
import ReactiveKit
import Alamofire
struct FieldsValidator {
  var error: NSError?
  
  init(_ properties: [(String, String?)]) {
    for (name, value) in properties {
      if value == nil || value?.characters.count == 0 {
        error = NSError(localizedDescription: "\(name) is empty")
        return
      }
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
