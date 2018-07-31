//
//  CircleButton.swift
//  Speach Recognition
//
//  Created by eDynamix Global on 31/07/2018.
//  Copyright © 2018 eDynamix Global. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {
    // Show an input in the Attributes Inspector
    @IBInspectable var cornerRadius: CGFloat = 30 {
        didSet {
            setupView()
        }
    }
    
    // This + @IBDesignable draws the changes in the designer
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
    }
}
