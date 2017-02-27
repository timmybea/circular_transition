//
//  ViewController.swift
//  circular_transition_animation
//
//  Created by Tim Beals on 2017-02-27.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "pink_floyd")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
        button.setTitle("T", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = ColorManager.customGold()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = button.frame.width / 2
        button.addTarget(self, action: #selector(pushToSecondVC), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(imageView)
        view.addSubview(button)
        
        view.addConstraintsWithFormat("H:|[v0]|", for: imageView)
        view.addConstraintsWithFormat("V:|-150-[v0(200)]", for: imageView)
        
        button.center = CGPoint(x: (view.frame.width / 2), y: 90)
    }
    
    
    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController()
        return vc
    }()
    
    func pushToSecondVC() {
        
        self.present(secondViewController, animated: true)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        button.center = CGPoint(x: (size.width / 2), y: 90)
    }

}

