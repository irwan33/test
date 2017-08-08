//
//  UIView+Extension.swift
//  Presentr
//
//  Created by Node8 on 2/1/17.
//  Copyright © 2017 Lususlab. All rights reserved.
//

import UIKit

extension UIView {
  func viewCircle() {
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = true
  }
}
