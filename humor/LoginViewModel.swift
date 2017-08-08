//
//  LoginViewModel.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/4/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import Bond
import ReactiveKit

class LoginViewModel {
  let email = Property<String?>("")
  let password = Property<String?>("")
  
  var state = String()
  
  private var properties: [(String, String?)] {
    return [("Email", email.value), ("Password", password.value)]
  }
  
  func loginEmail() -> Signal<Void, NSError> {
    state = "email"
    return FieldsValidator(self.properties).toSignal().flatMapLatest { _ -> Signal<Void, NSError> in
      let emailStr = self.email.value!
      let passwordStr = self.password.value!
      return ApiRequest.login(withEmail: emailStr, password: passwordStr).map {
        self.saveAccessToken($0)
      }
    }
  }
  


  func loginAutomaticallyEmail(_ email: String, password: String) -> Signal<Void, NSError> {
    state = "email"
    return ApiRequest.login(withEmail: email, password: password).map {
      self.saveAccessTokenIfAlreadyLoggedIn($0)
    }
  }

//  func loginWithFacebookToken(_ token: String) -> Signal<Void, NSError> {
//    state = "facebook"
//    saveAccessTokenFacebook(token)
//    return ApiRequest.login(withFacebookToken: token).map {
//      self.saveAccessToken($0)
//    }
//  }
//  
//  func loginWithTwitterToken(_ token: String, secret: String) -> Signal<Void, NSError> {
//    state = "twitter"
//    saveAccessTokenTwitter(token, secret_token : secret)
//    return ApiRequest.login(withTwitterToken: token, tokenSecret: secret).map {
//      self.saveAccessToken($0)
//    }
//  }
    
  private func saveAccessToken(_ user: User) {
    SavedData.shared.token = user.token
    SavedData.shared.email = self.email.value!
    SavedData.shared.password = self.password.value!
    SavedData.shared.type = self.state
  }
  
  private func saveAccessTokenIfAlreadyLoggedIn(_ user: User) {
    SavedData.shared.token = user.token
    SavedData.shared.type = self.state
  }
  
  private func saveAccessTokenFacebook(_ access_token: String) {
    SavedData.shared.tokenForFacebook = access_token
  }
  
  private func saveAccessTokenTwitter(_ access_token: String, secret_token : String) {
    SavedData.shared.tokenForTwitter = access_token
    SavedData.shared.tokenSecretForTwitter = secret_token
  }
  
//  private func saveRegId(_ user: User) {
//    SavedData.shared.reg_id = user.reg_id
//  }
}
