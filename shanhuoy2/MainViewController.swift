//
//  ViewController.swift
//  shanhuoy2
//
//  Created by Honor on 2015/4/12.
//  Copyright (c) 2015年 Honor. All rights reserved.
//

import UIKit
import TwitterKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        showTwitterLogoutView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showTwitterLogoutView()
    {
        let logOutButton:UIButton = UIButton(frame: CGRectMake(0, 0, 300, 50))
        logOutButton.setTitle("Twitter Logout", forState: UIControlState.Normal)
        logOutButton.backgroundColor = UIColor.blueColor()
        logOutButton.addTarget(self, action: "twiiterLogoutAction:", forControlEvents: UIControlEvents.TouchUpInside)
        logOutButton.center = CGPointMake(200, 300)
        self.view.addSubview(logOutButton)
    }
    
    func twiiterLogoutAction(sender:UIButton!)
    {
        Twitter.sharedInstance().logOut()
       
    }
}