//
//  GetProfileJSONParser.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/7/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import SwiftyJSON
import ReactiveKit

struct GetProfileJSONParser {
  var error: NSError?
  var user: User?
  
  init(_ json: JSON) {
    if let _ = json["username"].string{
      user = User()
      user?.username = json["username"].stringValue
      user?.name_display = json["name_display"].stringValue
//      user?.photoUrl = json["photo"].stringValue
      user?.email = json["email"].stringValue
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
