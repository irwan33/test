//
//  SavedData.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import SwiftyJSON
import Foundation
import ReactiveKit

class SavedData {
  
  static var shared = SavedData()
  
  init() {
    token = KeychainWrapper.stringForKey("token")
    email = KeychainWrapper.stringForKey("email")
    username = KeychainWrapper.stringForKey("username")
    password = KeychainWrapper.stringForKey("password")
    tokenForFacebook = KeychainWrapper.stringForKey("tokenFacebook")
    tokenForTwitter = KeychainWrapper.stringForKey("tokenTwitter")
    tokenSecretForTwitter = KeychainWrapper.stringForKey("tokenTwitterSecret")
  }
  
  //email token
  var token: String? {
    didSet {
      tokenProperty.value = token! != ""
      _ = KeychainWrapper.setString(token!, forKey: "token")
    }
  }
  
  let tokenProperty = Property<Bool>(false)
  
  //email
  var email: String? {
    didSet {
      emailProperty.value = email! != ""
      _ = KeychainWrapper.setString(email!, forKey: "email")
    }
  }
  
  let emailProperty = Property<Bool>(false)
  
  //username
  var username: String? {
    didSet {
      usernameProperty.value = username! != ""
      _ = KeychainWrapper.setString(username!, forKey: "username")
    }
  }
  
  let usernameProperty = Property<Bool>(false)
  
  //password
  var password: String? {
    didSet {
      passwordProperty.value = password! != ""
      _ = KeychainWrapper.setString(password!, forKey: "password")
    }
  }
  
  let passwordProperty = Property<Bool>(false)
  
  //login type
  var type: String? {
    didSet {
      typeProperty.value = type! != ""
      _ = KeychainWrapper.setString(type!, forKey: "loginType")
    }
  }
  
  let typeProperty = Property<Bool>(false)
  
  //facebook token
  var tokenForFacebook: String? {
    didSet {
      facebookTokenProperty.value = tokenForFacebook! != ""
      _ = KeychainWrapper.setString(tokenForFacebook!, forKey: "tokenFacebook")
    }
  }
  
  let facebookTokenProperty = Property<Bool>(false)
  
  //twitter token
  var tokenForTwitter: String? {
    didSet {
      twitterTokenProperty.value = tokenForTwitter! != ""
      _ = KeychainWrapper.setString(tokenForTwitter!, forKey: "tokenTwitter")
    }
  }
  
  let twitterTokenProperty = Property<Bool>(false)
  
  var tokenSecretForTwitter: String? {
    didSet {
      twitterSecretTokenProperty.value = tokenSecretForTwitter! != ""
      _ = KeychainWrapper.setString(tokenSecretForTwitter!, forKey: "tokenTwitterSecret")
    }
  }
  
  let twitterSecretTokenProperty = Property<Bool>(false)

  //first time login
  var firstTimeLogin: String? {
    didSet {
      firstTimeLoginProperty.value = firstTimeLogin! != ""
      _ = KeychainWrapper.setString(firstTimeLogin!, forKey: "firstTimeLogin")
    }
  }

  let firstTimeLoginProperty = Property<Bool>(false)
  
  
  func clear(){
    token = ""
    email = ""
    username = ""
    password = ""
    type = ""
    tokenForFacebook = ""
    tokenForTwitter = ""
    tokenSecretForTwitter = ""
    
    _ = KeychainWrapper.setString("", forKey: "token")
    _ = KeychainWrapper.setString("", forKey: "tokenFacebook")
    _ = KeychainWrapper.setString("", forKey: "tokenTwitter")
    _ = KeychainWrapper.setString("", forKey: "tokenTwitterSecret")
    _ = KeychainWrapper.setString("", forKey: "email")
    _ = KeychainWrapper.setString("", forKey: "username")
    _ = KeychainWrapper.setString("", forKey: "password")
    _ = KeychainWrapper.setString("", forKey: "userImage")
    _ = KeychainWrapper.setString("", forKey: "loginType")
  }
  
  func clearFacebook(){
    tokenForFacebook = ""
    _ = KeychainWrapper.setString("", forKey: "tokenFacebook")
  }
  
  func clearTwitter(){
    tokenForTwitter = ""
    tokenSecretForTwitter = ""
    _ = KeychainWrapper.setString("", forKey: "tokenTwitter")
    _ = KeychainWrapper.setString("", forKey: "tokenTwitterSecret")
  }

}
