//
//  UIViewController+SimpleTransition.swift
//  iOS Architectures
//
//  Created by Dave DeLong on 10/27/17.
//  Copyright © 2017 Dave DeLong. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func transition(to child: UIViewController, completion: ((Bool) -> Void)? = nil) {
    let duration = 0.3
    
    let current = childViewControllers.last
    addChildViewController(child)
    
    let newView = child.view!
    newView.translatesAutoresizingMaskIntoConstraints = true
    newView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    newView.frame = view.bounds
    
    if let existing = current {
      existing.willMove(toParentViewController: nil)
      
      transition(from: existing, to: child, duration: duration, options: [.transitionCrossDissolve], animations: { }, completion: { done in
        existing.removeFromParentViewController()
        child.didMove(toParentViewController: self)
        completion?(done)
      })
      
    } else {
      view.addSubview(newView)
      
      UIView.animate(withDuration: duration, delay: 0, options: [.transitionCrossDissolve], animations: { }, completion: { done in
        child.didMove(toParentViewController: self)
        completion?(done)
      })
    }
  }
  
  func addChildVC(_ child: UIViewController) {
    addChildViewController(child)
    
    let newView = child.view!
    newView.translatesAutoresizingMaskIntoConstraints = true
    newView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    newView.frame = view.bounds
    view.addSubview(newView)
    child.didMove(toParentViewController: self)
  }
  
  func removeChildVC(_ existing: UIViewController) {
    existing.willMove(toParentViewController: nil)
    existing.view.removeFromSuperview()
    existing.removeFromParentViewController()
  }
}


