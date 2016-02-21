//
//  AddBookVC.swift
//  BookThrift
//
//  Created by Serah Huynh on 2/21/16.
//  Copyright © 2016 T9Hacks. All rights reserved.
//

import Foundation

class AddBookVC: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var authortextfield: UITextField!

    @IBOutlet weak var descriptiontextfield: UITextView!
    @IBOutlet weak var pricetextfield: UITextField!
    @IBOutlet weak var isbnTextField: UITextField!
    
    var book: TextBook!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sellbuttonpressed(sender: AnyObject)
    {
        if let title1 = titleTextField.text, author = authortextfield.text, description=descriptiontextfield.text, price = pricetextfield.text, isbn = isbnTextField.text{
            if title1.isEmpty || title1 == "" || author.isEmpty || author == "" || description.isEmpty || description == "" || price.isEmpty || price == "" || isbn.isEmpty || isbn == "" {
                
                let alert = UIAlertController(title: "Oops", message: "please enter a password", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: { _ in
                    
                })
                alert.addAction(action)
                self.presentViewController(alert, animated: true){}
            }
            else {
                
                book = TextBook(name: title1, isbn: isbn, price: 0, description: description, author: author, catagory: "Biology")
                
                book.savebook()
            }
        }
        
    }
}
