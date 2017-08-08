//
//  UIImageView+Extension.swift
//  Presentr
//
//  Created by Node8 on 3/7/17.
//  Copyright © 2017 Lususlab. All rights reserved.
//

import UIKit

extension UIImageView {
  func imageCircle() {
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = true
  }
}
