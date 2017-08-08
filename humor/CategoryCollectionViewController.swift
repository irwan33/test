//
//  CategoryCollectionViewController.swift
//  humor
//
//  Created by Lusus Lab Bandung on 7/18/17.
//  Copyright © 2017 Lusus Lab Bandung. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CategoryCollectionViewCell"

class CategoryCollectionViewController: UICollectionViewController{
    var checkedIndexPath  = Set<IndexPath>()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Register cell classes
        self.collectionView!.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
        self.collectionView?.backgroundColor = UIColor.white
     
      
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

      // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
    
      let cellmainImage = UIImage(named: "sample.jpg")
      cell.cellmainImageView.image = cellmainImage
      cell.backgroundColor = UIColor.white
      cell.isChecked = self.checkedIndexPath.contains(indexPath)
        return cell
    }
  
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
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


extension UICollectionView {
  
  /// Iterates through all sections & items and selects them.
  func selectAll(animated: Bool) {
    (0..<numberOfSections).flatMap { (section) -> [IndexPath]? in
      return (0..<numberOfItems(inSection: section)).flatMap({ (item) -> IndexPath? in
        return IndexPath(item: item, section: section)
      })
      }.flatMap { $0 }.forEach { (indexPath) in
        selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
    
  }
  
  /// Deselects all selected cells.
  func deselectAll(animated: Bool) {
    indexPathsForSelectedItems?.forEach({ (indexPath) in
      deselectItem(at: indexPath, animated: animated)
    })
  }
  
}
