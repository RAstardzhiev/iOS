//
//  GoalCell.swift
//  Persistent Goal App
//
//  Created by eDynamix Global on 31/07/2018.
//  Copyright © 2018 eDynamix Global. All rights reserved.
//

import UIKit
import CoreData

class GoalCell: UITableViewCell {

    @IBOutlet weak var lblGoalDescription: UILabel!
    @IBOutlet weak var lblGoalType: UILabel!
    @IBOutlet weak var lblGoalProgress: UILabel!
    
    func configureCell(description: String, type: GoalType, goalProgress: Int) {
        lblGoalDescription.text = description
        lblGoalType.text = type.rawValue
        lblGoalProgress.text = String(describing: goalProgress)
    }
    
}
