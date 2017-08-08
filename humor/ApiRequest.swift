//
//  ApiRequest.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ReactiveAlamofire
import ReactiveKit

class ApiRequest {

  // MARK: Account
  class func login(withEmail email: String, password: String) -> Signal<User, NSError> {
    let parameters = [
      "email": email,
      "password": password
    ]
    return requestWithoutBearer(endpoint: .login, method: .post, parameters: parameters).flatMapLatest { LoginJSONParser($0).toSignal() }
  }


  class func signup(withUsername username: String, email: String, password: String) -> Signal<Void, NSError> {
    let parameters = [
      "username": username,
      "email": email,
      "password1": password,
      "password2": password
    ]
    return requestWithoutBearer(endpoint: .auth, method: .post, parameters: parameters).flatMapLatest { RegistrationJSONParser($0).toSignal() }
  }

  /// MARK: Profile
  class func getProfile() -> Signal<User, NSError> {
    return requestTo(endpoint: .profile, method: .get, parameters: nil).flatMapLatest { GetProfileJSONParser($0).toSignal() }
  }
}


extension ApiRequest {
  

  class func requestTo(endpoint: ApiEndpoint, method: HTTPMethod, parameters: [String: Any]?) -> Signal<JSON, NSError> {
    var headers: HTTPHeaders?
    
    if let token =  SavedData.shared.token {
      headers = ["Authorization":"Bearer \(token)","Content-Type":"application/x-www-form-urlencoded"]
    }
    
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    
    return Alamofire.request(Router.urlFor(endpoint), method: method, parameters: parameters, headers: headers)
      .responseString { response in
        print("Success: \(response.result.isSuccess)")
        print("Response Code : \(response.response?.statusCode)")
        print("Response String: \(response.result.value)")
        
        let statusCode = response.response?.statusCode
        if statusCode == 429 {
          let topWindow = UIWindow(frame: UIScreen.main.bounds)
          topWindow.rootViewController = UIViewController()
          let alert = UIAlertController(title: "Peeqr", message: "Request Failed. Please Try Again Later.", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "confirm"), style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            
          }))
          topWindow.makeKeyAndVisible()
          topWindow.rootViewController?.present(alert, animated: true, completion: { _ in })
        }
      }
      .toJSONSignal()
      .map {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("JSON Result is \(JSON($0))")
        print(Router.urlFor(endpoint))
        return JSON($0)
      }
      .mapError { (error) -> NSError in
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("ERROR is \(error)")
        print(Router.urlFor(endpoint))
        return error
      }
      .flatMapLatest { ErrorParser($0).toSignal() }
  }

  
  class func requestWithoutBearer(endpoint: ApiEndpoint, method: HTTPMethod, parameters: [String: Any]?) -> Signal<JSON, NSError> {
    var headers: HTTPHeaders?
    
    headers = ["Content-Type":"application/x-www-form-urlencoded","APP-VERSION":"1.0.7"]
    
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    
    return Alamofire.request(Router.urlFor(endpoint), method: method, parameters: parameters, headers: headers)
      .toJSONSignal()
      .map {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("JSON Login is \(JSON($0))")
        
        return JSON($0)
      }
      .mapError { (error) -> NSError in
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("ERROR Login is \(error)")
        return error
      }
      .flatMapLatest { ErrorParser($0).toSignal() }
  }
}
