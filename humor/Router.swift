//
//  Router.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import Foundation

enum ApiEndpoint {
  case login
  case auth
  case connectFacebook
  case connectTwitter
  case profile
  
  var path: String {
    switch self {
    case .login:
      return "/api/auth/login/"
    case .auth:
      return "/api/auth/registration/"
    case .connectFacebook:
      return "/api/connect/facebook/"
    case .connectTwitter:
      return "/api/connect/twitter/"
    case .profile:
      return "/api/profile/"
    }
  }
}


class Router {
  class func urlFor(_ endpoint: ApiEndpoint) -> String {
    return Secrets.Api.baseUrl + endpoint.path
  }
  
  class func postFix(_ endpoint: ApiEndpoint) -> String {
    return endpoint.path
  }
}

