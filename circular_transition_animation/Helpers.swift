//
//  Helpers.swift
//  circular_transition_animation
//
//  Created by Tim Beals on 2017-02-27.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstraintsWithFormat(_ format: String, for views:UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let string = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[string] = view
        }
            
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
    
}


class ColorManager: NSObject {
    
    class func customGold() -> UIColor {
        return UIColor(red: 227/255, green: 147/255, blue: 33/255, alpha: 1)
    }
}
