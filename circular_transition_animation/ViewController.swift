//
//  ViewController.swift
//  circular_transition_animation
//
//  Created by Tim Beals on 2017-02-27.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let transition = CircularTransition()
    
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

    
    func pushToSecondVC() {
        let secondViewController = SecondViewController()
        secondViewController.transitioningDelegate = self
        secondViewController.modalPresentationStyle = .custom
        self.present(secondViewController, animated: true)
    }

    //MARK: repositions the views in the event of a transition (change in orientation)
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        button.center = CGPoint(x: (size.width / 2), y: 90)
    }
    
    //MARK: delegate functions
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = button.center
        transition.circleColor = ColorManager.customGold()
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = button.center
        transition.circleColor = ColorManager.customGold()
        
        return transition
    }
}

