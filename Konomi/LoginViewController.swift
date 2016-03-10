//
//  LoginViewController.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/08.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        Login.login() { [unowned self] error in
            if error != nil { fatalError("\(error)") }
            
            print(Account.twitterAccount)
            
            dispatch_async(dispatch_get_main_queue()) {
                self.transitionToTimelineTableVC()
            }
        }
    }
    
    func transitionToTimelineTableVC() {
        performSegueWithIdentifier("PushTimelineTableVC", sender: nil)
    }
    
}
