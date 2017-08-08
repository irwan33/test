//
//  HomeViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/17/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

class FeatureViewController: UIViewController {
@IBOutlet weak var tableView: UITableView!
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        self.tableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension FeatureViewController {
  func registerCell() {
    tableView.register(UINib(nibName: String(describing: FeaturedTableViewCell.self), bundle: nil), forCellReuseIdentifier: FeaturedTableViewCell.reuseID)
  }
}


extension FeatureViewController : UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedTableViewCell.reuseID, for: indexPath) as! FeaturedTableViewCell
    cell.selectionStyle = .none
    let cellmainImage = UIImage(named: "sample.jpg")
    cell.imageViewCell.image = cellmainImage
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 300
  }
}
