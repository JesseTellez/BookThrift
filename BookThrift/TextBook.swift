//
//  TextBook.swift
//  BookThrift
//
//  Created by Serah Huynh on 2/21/16.
//  Copyright © 2016 T9Hacks. All rights reserved.
//

import Foundation

class TextBook {
    
    private var _textBookName: String!
    private var _author: String!
    private var _ISBN: String!
    var _textBookImage: UIImage!
    private var _description: String!
    private var _price: Int!
    private var _rent: Bool!
    private var _buy: Bool!
    private var _catagory: String!
    
    var catagory: String {
        return _catagory
    }
    
    
    init(name: String, isbn: String, price: Int, description: String, author: String, catagory: String){
        self._textBookName = name
        self._ISBN = isbn
        self._price = price
        self._description = description
        self._author = author
        self._catagory = catagory
    }
    
    func savebook()
    {
        let pref = NSUserDefaults.standardUserDefaults()
        pref.setValue(_textBookName, forKey: "textbook title")
        pref.setValue(_author, forKey: "author")
        pref.setValue(_ISBN, forKey: "ISBN")
        pref.setValue(_description, forKey: "descrip")
        pref.setValue(_price, forKey: "money")
        pref.setValue(_catagory, forKey: "catagory")
        pref.synchronize()
    }
    
    func addImagetoBook(image: UIImage){
        self._textBookImage = image
    }
}