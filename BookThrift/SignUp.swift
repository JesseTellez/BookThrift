//
//  SignUp.swift
//  BookThrift
//
//  Created by Serah Huynh on 2/21/16.
//  Copyright © 2016 T9Hacks. All rights reserved.
//

import Foundation

class SignUp: UIViewController {

    @IBOutlet weak var usernameTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createBtnPressed(sender: AnyObject) {
        if let name = usernameTxtField.text, pass = passwordTxtField.text {
            if name == "" || name.isEmpty {
                let alert = UIAlertController(title: "Oops", message: "please enter a username", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: { _ in
                    
                })
                alert.addAction(action)
                self.presentViewController(alert, animated: true){}
            }
            
            else if pass == "" || pass.isEmpty {
                let alert = UIAlertController(title: "Oops", message: "please enter a username", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: { _ in
                    
                })
                alert.addAction(action)
                self.presentViewController(alert, animated: true){}
            }
            else {
                let username2 = name.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                let password2 = pass.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                
                user = User(name: username2, pass: password2)
                user.save()
                
                dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
}