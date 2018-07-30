//
//  UIButtonExtensions.swift
//  Button Animations
//
//  Created by eDynamix Global on 30/07/2018.
//  Copyright © 2018 eDynamix Global. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
    }
    
    func flashing() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    func wiggle() {
        let wiggleAnimation = CABasicAnimation(keyPath: "position")
        wiggleAnimation.duration = 0.03
        wiggleAnimation.repeatCount = 5
        wiggleAnimation.autoreverses = true
        
        wiggleAnimation.fromValue = CGPoint(x: self.center.x - 5.0, y: self.center.y)
        wiggleAnimation.toValue = CGPoint(x: self.center.x + 5.0, y: self.center.y)
        
        layer.add(wiggleAnimation, forKey: "position")
    }
}
