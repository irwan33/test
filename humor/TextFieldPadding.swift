//
//  TextFieldPadding.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/7/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

@IBDesignable
class FormTextField: UITextField {
  
  @IBInspectable var inset: CGFloat = 0
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.insetBy(dx: inset, dy: inset)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return textRect(forBounds: bounds)
  }
  
}
