//
//  Modal.swift
//  socialeo
//
//  Created by Mike Milord on 14/09/2018.
//  Copyright © 2018 First Republic. All rights reserved.
//


/// An extension of the custom Modal protocol to expend the required functionalities
/// Here we will animate the view representing the custom alert view, but also the view of the background.

import Foundation
import UIKit

extension Modal where Self:UIView{
    
    /// Extention of the Modal protocol expending the functions
    
    // To mimic built-in the presentViewController
    func show(animated:Bool){
        self.backgroundView.alpha = 0
        if var topController = UIApplication.shared.delegate?.window??.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.view.addSubview(self)
        }
        if animated {
            UIView.animate(withDuration: 0.33, animations: {
                self.backgroundView.alpha = 0.66
            })
            UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: UIViewAnimationOptions(rawValue: 0), animations: {
                self.statsAlertView.center  = self.center
            }, completion: { (completed) in
                
            })
        }else{
            self.backgroundView.alpha = 0.66
            self.statsAlertView.center  = self.center
        }
    }
    
    // To mimic the built-in dismiss view
    func dismiss(animated:Bool){
        if animated {
            UIView.animate(withDuration: 0.33, animations: {
                self.backgroundView.alpha = 0
            }, completion: { (completed) in
                
            })
            UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: UIViewAnimationOptions(rawValue: 0), animations: {
                self.statsAlertView.center = CGPoint(x: self.center.x, y: self.frame.height + self.statsAlertView.frame.height/2)
            }, completion: { (completed) in
                self.removeFromSuperview()
            })
        }else{
            self.removeFromSuperview()
        }
        
    }
}

