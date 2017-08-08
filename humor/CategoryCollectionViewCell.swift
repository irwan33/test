//
//  CatecortCollectionViewCell.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/18/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var cellmainImageView: UIImageView!
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  
  @IBOutlet weak var checkBoxImageView: UIImageView!
  
  var isChecked: Bool = false {
    didSet {
      if isChecked {
        self.checkBoxImageView.image = UIImage(named: "checkmark")
      } else {
        self.checkBoxImageView.image = UIImage(named: "asfalt-light")
      }
    }
  }


}

