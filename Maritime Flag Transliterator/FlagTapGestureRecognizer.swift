//
//  FlagTapGestureRecognizer.swift
//  Maritime Flag Transliterator
//
//  Created by Austin Almond on 1/11/16.
//  Copyright © 2016 Austin Almond. All rights reserved.
//

import UIKit

class FlagTapGestureRecognizer: UITapGestureRecognizer {
    
    var output : String? // Text output by this flag
    
    
    init(target: AnyObject?, action: Selector, output: String) {
        super.init(target: target, action: action)
        
        self.output = output
    }
}
