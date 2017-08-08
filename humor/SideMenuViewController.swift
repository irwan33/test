//
//  SideMenuViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/20/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var menuTable: UITableView!

  let  tittle_arr = ["Profile Settings" , "App Settings" , "My Videos" , "Help" , "Log Out"]
		
    override func viewDidLoad() {
        super.viewDidLoad()

        menuTable.delegate = self
        menuTable.dataSource = self
      
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tittle_arr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "menu_cell")
    let category = tittle_arr[indexPath.row]
    cell.textLabel?.text = category

    return cell
  }
}
