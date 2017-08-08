//
//  LoginViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/17/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit
import ReactiveKit
import Material

class LoginViewController: UIViewController {
  static let reuseID = "LoginVC"
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var signInButton: UIButton!
  @IBOutlet weak var signButton: UIButton!
  fileprivate let viewModel = LoginViewModel()
//  var alreadyLoggedIn: Bool {
//    return RealmHelper.shared.copyUser != nil
//  }
  var loginObserver: ( (Event<Void, NSError>) -> Void )!
    override func viewDidLoad() {
        super.viewDidLoad()
      bindViewModel()

     
    }
  
  override var  shouldAutorotate : Bool {
    return false
  }
  
  override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
    return UIInterfaceOrientationMask.portrait
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidDisappear(animated)
//    checkLoginState()
  }

}




extension LoginViewController {
  func bindViewModel() {
    viewModel.email.bidirectionalBind(to: emailTextField.reactive.text)
    viewModel.password.bidirectionalBind(to: passwordTextField.reactive.text)
    
    signButton.reactive.tap.observeNext {
      self.goToSign()
      }.dispose(in: bag)
    
    loginObserver = { (event: Event<Void, NSError>) in
      HUDManager.hideHUD()
      if case .failed(let error) = event {
        self.showAlertMessage(error.localizedDescription)
      } else if case .completed = event {
        self.goToHome()
        SavedData.shared.firstTimeLogin = "true"

        print("First launch, setting UserDefault.")
        UserDefaults.standard.set(true, forKey: "launchedBefore")
        UserDefaults.standard.synchronize()
      }
    }
    
      signInButton.reactive.tap.observeNext { [weak self, bag = self.reactive.bag] in
      HUDManager.showHUDActivity()
      self?.viewModel.loginEmail().observe(with: (self?.loginObserver)!).dispose(in: bag)
      }.dispose(in: bag)
  }
}

extension LoginViewController {
  

  
  func showViewContainer() {
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
//      self.viewContainer.alpha = 1.0
      self.view.layoutIfNeeded()
    }, completion: { _ in })
  }
  
  func goToHome() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: ViewController.reuseID)
    self.present(controller, animated: true, completion: nil)
  }
  
  func goToSign() {
    performSegue(withIdentifier: "fromLoginToSign", sender: nil)
  }
  
  func goToRegister() {
    performSegue(withIdentifier: "fromLoginToRegister", sender: nil)
  }
}

