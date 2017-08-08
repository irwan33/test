//
//  RegisterViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/17/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit
import Material

import Reachability

class RegisterViewController: UIViewController {

  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
 
  @IBOutlet weak var signupButton: UIButton!
 
  let viewModel = RegisterViewModel()
//  var reachability = Reachability(hostName: Secrets.Api.hostName)
//  var networkAvailable = true
  
    override func viewDidLoad() {
        super.viewDidLoad()

      bindViewModel()
      
    }

  
//  @IBAction func done(sender: AnyObject) {
//    if((self.presentingViewController) != nil){
//      self.dismiss(animated: false, completion: nil)
//      
//    }
//  }
  
  
  func bindViewModel() {
    viewModel.username.bidirectionalBind(to: usernameTextField.reactive.text)
    viewModel.email.bidirectionalBind(to: emailTextField.reactive.text)
    viewModel.password.bidirectionalBind(to: passwordTextField.reactive.text)
    
    let signObserver = { (event: Event<Void, NSError>) in
      if case .failed(let error) = event {
        self.showAlertMessage(error.localizedDescription)
      } else if case .completed = event {
        self.showSuccessMessage("Please confirm your email address and then log in")
        self.dismiss(animated: true, completion: nil)
      }
    }

    
    
    
    signupButton.reactive.tap.observeNext { [weak self, bag = self.reactive.bag] in
      self?.viewModel.signUp().observe(with: signObserver).dispose(in: bag)
      }.dispose(in: bag)
    
    loginButton.reactive.tap.observeNext { [weak self, bag = self.reactive.bag] in
      self?.dismiss(animated: true, completion: nil)
      }.dispose(in: bag)

  }

  
  
}
//extension RegisterViewController : UITextFieldDelegate {
//  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//    
//    let char = string.cString(using: String.Encoding.utf8)!
//    let isBackSpace = strcmp(char, "\\b")
//    
//    return string.containsValidCharacter || (isBackSpace == -92)
//  }
//  
//  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//    let char = string.cString(using: String.Encoding.utf8)!
//    let isBackSpace = strcmp(char, "\\b")
//    
//    if (isBackSpace == -92) {
//      print("Backspace was pressed")
//    }
//    return true
//  }
//  
//}
//
//extension RegisterViewController {
//
//  func setupReachability() {
//    if let reachability = reachability {
//      reachability.reachableBlock = { _ in self.networkAvailable = true }
//      reachability.unreachableBlock = { _ in self.networkAvailable = false }
//      
//      reachability.startNotifier()
//    }
//  }
//}

