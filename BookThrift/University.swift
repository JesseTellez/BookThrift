//
//  University.swift
//  BookThrift
//
//  Created by Serah Huynh on 2/20/16.
//  Copyright © 2016 T9Hacks. All rights reserved.
//

import Foundation

class University {
    
    private var _name: String!
    private var _uniId: Int!
    
    var name: String {
        return _name
    }
    
    var uniId: Int {
        return _uniId
    }
    
    init(name: String, id: Int){
        self._name = name
        self._uniId = id
    }
    
    
}