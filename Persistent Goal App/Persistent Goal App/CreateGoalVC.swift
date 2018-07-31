//
//  CreateGoalVC.swift
//  Persistent Goal App
//
//  Created by eDynamix Global on 31/07/2018.
//  Copyright © 2018 eDynamix Global. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func longTermBtnTap(_ sender: UIButton) {
    }
    
    @IBAction func shortTermBtnTap(_ sender: UIButton) {
    }
    
    @IBAction func nextBtnTap(_ sender: UIButton) {
    }
    
    @IBAction func backBtnTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
