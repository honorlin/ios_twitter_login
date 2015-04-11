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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        let logInButton = TWTRLogInButton(logInCompletion: {
            (session: TWTRSession!, error: NSError!) in
            // play with Twitter session
            
            
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

