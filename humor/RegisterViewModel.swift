//
//  RegisterViewModel.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class RegisterViewModel {
  let username = Property<String?>("")
  let email = Property<String?>("")
  let password = Property<String?>("")
  
  private var properties: [(String, String?)] {
    return [("Username", username.value), ("Email", email.value), ("Password", password.value)]
  }
  
  func signUp() -> Signal<Void, NSError> {
    return FieldsValidator(self.properties).toSignal().flatMapLatest { _ -> Signal<Void, NSError> in
      let usernameStr = self.username.value!
      let emailStr = self.email.value!
      let passwordStr = self.password.value!
      
      return ApiRequest.signup(withUsername: usernameStr, email: emailStr, password: passwordStr)
    }
  }
}
