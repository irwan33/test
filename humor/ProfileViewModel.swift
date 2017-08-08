//
//  ProfileViewModel.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/7/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class ProfileViewModel {
 
//  var user = RealmHelper.shared.copyUser
  
  let userName = Property<String?>("")
  private var properties: [(String, String?)] {
    return [("username", userName.value)]
  }

  
  func getProfile() -> Signal<User, NSError> {
    return ApiRequest.getProfile()
  }
  
  func updateProfile(_ user: User) {
//    RealmHelper.shared.updateUserdata(user: user)
  }
  
  private func saveProfile(_ user: User) {
    SavedData.shared.username = user.username
  
  }


}
