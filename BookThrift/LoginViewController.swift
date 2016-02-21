//
//  LoginViewController.swift
//  BookThrift
//
//  Created by Serah Huynh on 2/21/16.
//  Copyright © 2016 T9Hacks. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernametextfield: UITextField!
    @IBOutlet weak var passwordtextfield: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var anyThingIWant: User!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        welcomeLabel.hidden = true
    }
    
    
    
    @IBAction func logOnBtnPressed(sender: AnyObject) {
        if let name = usernametextfield.text, pass = passwordtextfield.text as String? {
            if name == "" || name.isEmpty {
                let alert = UIAlertController(title: "Oops", message: "please enter a username", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: { _ in
                    
                })
                alert.addAction(action)
                self.presentViewController(alert, animated: true){}
            }
                
            else if pass == "" || pass.isEmpty {
                let alert = UIAlertController(title: "Oops", message: "please enter a password", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: { _ in
                    
                })
                alert.addAction(action)
                self.presentViewController(alert, animated: true){}
            }
            else {
                let username2 = name.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                let password2 = pass.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                anyThingIWant = User(name: username2, pass: password2)
                if anyThingIWant.logInUser() == true {
                    
                    self.revealViewController().performSegueWithIdentifier("sw_front", sender: anyThingIWant)
                    
                    usernametextfield.hidden = true
                    passwordtextfield.hidden = true
                    welcomeLabel.hidden = false
                    
                }else {
                    let alert = UIAlertController(title: "Wrong!", message: "please the correct username or password", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "FINE!", style: .Default, handler: { _ in
                        
                    })
                    alert.addAction(action)
                    self.presentViewController(alert, animated: true){}
                }
            }
        }
    }
}
