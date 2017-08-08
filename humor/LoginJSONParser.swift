//
//  LoginJSONParser.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/4/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import SwiftyJSON
import ReactiveKit

struct LoginJSONParser {
  var error: NSError?
  var user : User?
  
  init(_ json: JSON) {
    if let _ = json["token"].string {
      user = User()
      user?.token = json["token"].stringValue
      if let _ = json["user"]["email"].string {
        user?.email = json["user"]["email"].string!
      }
    } else if let _ = json["code"].string {
      user = User()
      user?.token = json["code"].stringValue
    } else {
      error = NSError(fromJSON: json)
    }
  }
  
  func toSignal() -> Signal<User, NSError> {
    return Signal<User, NSError> { producer in
      if let error = self.error {
        producer.failed(error)
      } else if let user = self.user {
        producer.completed(with: user)
      } else {
        producer.failed(NSError(localizedDescription: "Unknown error"))
      }
      
      return NonDisposable.instance
    }
  }
}
