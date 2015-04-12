//
//  ViewController.swift
//  shanhuoy2
//
//  Created by Honor on 2015/4/12.
//  Copyright (c) 2015年 Honor. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    var logOutButton: UIButton?
    var logInButton: TWTRLogInButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        showTwitterView()

    }
    
    func showTwitterView(){
        if(Twitter.sharedInstance().session() == nil)
        {
            showTwitterLoginView()
            removeTwitterLogOutView()
        }
        else
        {
            showTwitterLogoutView()
            removeTwitterLoginView()
        }
    
    }
    
    func removeTwitterLogOutView(){
    
        logOutButton?.removeFromSuperview()
        logOutButton?.hidden = true;
    }
    
    func removeTwitterLoginView(){
        logInButton?.removeFromSuperview()
        logInButton?.hidden = true;
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
        showTwitterView()
    }
    
    func showTwitterLoginView(){
        
        let logInButton = TWTRLogInButton(logInCompletion: {
            (session: TWTRSession!, error: NSError!) in
            // play with Twitter session
            
            if (session != nil) {
                println("signed in as \(session.userName)");
            } else {
                println("error: \(error.localizedDescription)");
            }
            
            self.showTwitterView()
            self.performSegueWithIdentifier("toMain",  sender: nil)
            
        })
        logInButton.center = CGPointMake(200, 100)
        self.view.addSubview(logInButton)
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

