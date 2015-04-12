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

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userIDLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        showTwitterLogoutView()
        userNameLabel.text = "Name: " + Twitter.sharedInstance().session().userName
        userIDLabel.text = "ID: " + Twitter.sharedInstance().session().userID
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showTwitterLogoutView()
    {
        let logOutButton:UIButton = UIButton(frame: CGRectMake(0, 0, 300, 40))
        logOutButton.setTitle("Logout", forState: UIControlState.Normal)
        logOutButton.backgroundColor = UIColorFromRGB(0x4099FF)
        logOutButton.addTarget(self, action: "twiiterLogoutAction:", forControlEvents: UIControlEvents.TouchUpInside)
        logOutButton.center = CGPointMake(200, 100)
        self.view.addSubview(logOutButton)
    }
    
    func twiiterLogoutAction(sender:UIButton!)
    {
        Twitter.sharedInstance().logOut()
        self.performSegueWithIdentifier("toLogin",  sender: nil)
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}