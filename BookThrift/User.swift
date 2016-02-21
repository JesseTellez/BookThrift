//
//  User.swift
//  BookThrift
//
//  Created by Serah Huynh on 2/21/16.
//  Copyright © 2016 T9Hacks. All rights reserved.
//

import Foundation

class User {
    
    
    private var _username: String!
    private var _password: String!
    
    var userSales: [TextBook]!
    
    init(name: String, pass: String){
        self._username = name
        self._password = pass
    }
    
    func save() {
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setValue(_username, forKey: "username")
        prefs.setValue(_password, forKey: "password")
        
        prefs.synchronize()
    }
    
    func logInUser() -> Bool {
        
        let prefs = NSUserDefaults.standardUserDefaults()
        
        if let username = prefs.stringForKey("username"), pass = prefs.stringForKey("password") {
            if _username == username && _password == pass {
                return true
            }else{
                return false
            }
        } else {
            return false
        }
    }
    
    

}
