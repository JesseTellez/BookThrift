//
//  UniCell.swift
//  BookThrift
//
//  Created by Serah Huynh on 2/20/16.
//  Copyright © 2016 T9Hacks. All rights reserved.
//

import UIKit

class UniCell: UITableViewCell {
    
    @IBOutlet weak var uniLabel: UILabel!
    
    var university: University!
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(uni: University) {
        self.university = uni
        uniLabel.text = self.university.name.capitalizedString
    }

}
