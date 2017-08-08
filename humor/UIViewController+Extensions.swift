//
//  UIViewController+Extensions.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit
import CWStatusBarNotification
import Bond

extension UIViewController {
  func showAlertMessage(_ message: String) {
    showNotificationMessage(message: message, error: true)
  }
  
  func showSuccessMessage(_ message: String) {
    showNotificationMessage(message: message, error: false)
  }
  
  func showNotificationMessage(message: String, error: Bool) {
    let notification = CWStatusBarNotification()
    notification.notificationLabelBackgroundColor = error ? Constant.StatusBarNotification.Color.alertBackground : Constant.StatusBarNotification.Color.successBackground
    notification.notificationLabelTextColor = Constant.StatusBarNotification.Color.text
    notification.notificationStyle = .navigationBarNotification
    notification.multiline = true
    notification.notificationAnimationInStyle = .top
    notification.notificationAnimationOutStyle = .top
    notification.notificationAnimationType = .overlay
    notification.display(withMessage: message, forDuration: Constant.StatusBarNotification.duration)
  }
  
  var bnd_showError: Bond<NSError> {
    return Bond(target: self) { controller, error in
      controller.showAlertMessage(error.localizedDescription)
    }
  }
  
  func showAlertController(message: String, title: String = "", defaultButtonTitle: String = "Cancel", otherButtonTitle: String = "OK", otherActionHandler: (() -> Void)? = nil) {
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    controller.addAction(UIAlertAction(title: defaultButtonTitle, style: .cancel, handler: nil))
    if let otherActionHandler = otherActionHandler {
      let otherAction = UIAlertAction(title: otherButtonTitle, style: .default) { _ in
        otherActionHandler()
      }
      controller.addAction(otherAction)
    }
    
    present(controller, animated: true, completion: nil)
  }
  
  func showAlertControllerTextfield(message: String, title: String = "", defaultButtonTitle: String = "Cancel", otherButtonTitle: String = "OK", otherActionHandler: ((_ questionText: String) -> Void)? = nil) {
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    controller.addAction(UIAlertAction(title: defaultButtonTitle, style: .cancel, handler: nil))
    controller.addTextField { (textField) in
      textField.placeholder = "Your question"
    }
    if let otherActionHandler = otherActionHandler {
      let otherAction = UIAlertAction(title: otherButtonTitle, style: .default) { _ in
        let qText = controller.textFields?[0].text
        otherActionHandler(qText!)
      }
      controller.addAction(otherAction)
    }
    present(controller, animated: true, completion: nil)
  }
}
