//
//  SecondViewController.swift
//  circular_transition_animation
//
//  Created by Tim Beals on 2017-02-27.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
        button.setTitle("X", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = ColorManager.customGold()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = button.frame.width / 2
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(button)
        
        button.center = CGPoint(x: (view.frame.width / 2), y: 90)
        
    }

    func dismissVC() {
        
        self.dismiss(animated: true, completion: nil)
    }

}
