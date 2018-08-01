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
    @IBOutlet weak var completionView: UIView!
    
    func configureCell(goal: Goal) {
        lblGoalDescription.text = goal.goalDescription
        lblGoalType.text = goal.goalType
        lblGoalProgress.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
    }
}
