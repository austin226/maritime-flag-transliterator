//
//  HeaderView.swift
//  Maritime Flag Transliterator
//
//  Created by Austin Almond on 1/11/16.
//  Copyright © 2016 Austin Almond. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var flagTextField: UITextField!
    
    @IBAction func clearButton(sender: AnyObject) {
        flagTextField.text = ""
    }
}
