//
//  ViewController.swift
//  SnapLike
//
//  Created by Kartikeya Saxena Jain on 10/21/15.
//  Copyright © 2015 Kartikeya Saxena Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  static let reuseID = "VC1"
    @IBOutlet weak var scrollView: UIScrollView!
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Initialize using Unique ID for the View
        let V1 = self.storyboard?.instantiateViewController(withIdentifier: "LeftMenu") as UIViewController!
        //Add initialized view to main view and its scroll view and also set bounds
        self.addChildViewController(V1!)
        self.scrollView.addSubview((V1?.view)!)
        V1?.didMove(toParentViewController: self)
        V1?.view.frame = scrollView.bounds
        //Create frame for the view and define its urigin point with respect to View 1 - We dont need it here
        
        //Initialize using Unique ID for the View
        let V2 = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as UIViewController!
        //Add initialized view to main view and its scroll view also set bounds
        self.addChildViewController(V2!)
        self.scrollView.addSubview((V2?.view)!)
        V2?.didMove(toParentViewController: self)
        V2?.view.frame = scrollView.bounds
        
        //Create frame for the view and define its urigin point with respect to View 1
        var V2Frame: CGRect = V2!.view.frame
        V2Frame.origin.x = self.view.frame.width
        V2?.view.frame = V2Frame
        
//        //Initialize using Unique ID for the View
//        let V3 = self.storyboard?.instantiateViewController(withIdentifier: "V3") as UIViewController!
//        //Add initialized view to main view and its scroll view also set bounds
//        self.addChildViewController(V3!)
//        self.scrollView.addSubview((V3?.view)!)
//        V3?.didMove(toParentViewController: self)
//        V3?.view.frame = scrollView.bounds
        
        //Create frame for the view and define its urigin point with respect to View 1
//        var V3Frame: CGRect = V3!.view.frame
//        V3Frame.origin.x = 2 * self.view.frame.width
//        V3?.view.frame = V3Frame
      
        //The width is set here as we are dealing with Horizontal Scroll
        //The Width is x3 as there are 3 sub views in all
        self.scrollView.contentSize = CGSize(width: (self.view.frame.width) * 2, height: (self.view.frame.height))
        
        //The offset values are for telling where the scroll view sees its x and y point as origin
        //try setting the value to 2, and 3 to feel the difference----this value here
        self.scrollView.contentOffset = CGPoint(x: (self.view.frame.width) * 1, y: (self.view.frame.height))
        //hi
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

