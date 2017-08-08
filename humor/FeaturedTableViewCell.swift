//
//  FeaturedTableViewCell.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/17/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

class FeaturedTableViewCell: UITableViewCell {

  @IBOutlet weak var titleFeatured: UILabel!
  @IBOutlet weak var imageViewCell: UIImageView!
  @IBOutlet weak var userFeatured: UILabel!
  static let reuseID = "featuredTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
