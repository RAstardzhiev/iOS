//
//  ViewController.swift
//  FirstApp
//
//  Created by eDynamix Global on 20/07/2018.
//  Copyright © 2018 eDynamix Global. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblFirst: UILabel!
    @IBOutlet weak var lblMiddle: UILabel!
    @IBOutlet weak var lblThird: UILabel!
    
    @IBOutlet weak var tbFirst: UITextField!
    @IBOutlet weak var tbMiddle: UITextField!
    @IBOutlet weak var tbThird: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblFirst.text = ""
        lblMiddle.text = ""
        lblThird.text = ""

    }
    
    @IBAction func BtnApplyTextClick(_ sender: Any) {
        lblFirst.text = tbFirst.text
        lblMiddle.text = tbMiddle.text
        lblThird.text = tbThird.text
    }
    
    @IBAction func TbThirdChange(_ sender: Any) {
        lblThird.text = tbThird.text
    }
}

	
