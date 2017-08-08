//
//  TrendingViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 8/3/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

  var checkedIndexPath  = Set<IndexPath>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1     //return number of sections in collection view
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  // make a cell for each cell index path
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    // get a reference to our storyboard cell
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CategoryCollectionViewCell
    
    let cellmainImage = UIImage(named: "sample.jpg")
    cell.cellmainImageView.image = cellmainImage
    cell.backgroundColor = UIColor.white
    cell.isChecked = self.checkedIndexPath.contains(indexPath)
    return cell

  }

  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
    
    if self.checkedIndexPath.contains(indexPath) {
      self.checkedIndexPath.remove(indexPath)
      cell.isChecked = false
      
    } else {
      self.checkedIndexPath.insert(indexPath)
      cell.isChecked = true
    }
    
    
  }

}

