//
//  ViewController.swift
//  Button Animations
//
//  Created by eDynamix Global on 30/07/2018.
//  Copyright © 2018 eDynamix Global. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnPulseTap(_ sender: UIButton) {
        sender.pulsate()
    }
    @IBAction func btnFlashTap(_ sender: UIButton) {
        sender.flashing()
    }
    @IBAction func btnWiggleTap(_ sender: UIButton) {
        sender.wiggle()
    }
}

