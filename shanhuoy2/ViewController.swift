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
       
        showTwitterLoginView()

    }
    

    
    func removeTwitterLogOutView(){
    
        logOutButton?.removeFromSuperview()
        logOutButton?.hidden = true;
    }
    
    func removeTwitterLoginView(){
        logInButton?.removeFromSuperview()
        logInButton?.hidden = true;
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

