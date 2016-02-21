//
//  ViewController.swift
//  BookThrift
//
//  Created by Serah Huynh on 2/20/16.
//  Copyright © 2016 T9Hacks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var OpenBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OpenBtn.target = self.revealViewController()
        OpenBtn.action = Selector("revealToggle:")
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }

}

