//
//  ViewController.swift
//  MoleShooter
//
//  Created by eDynamix Global on 20/07/2018.
//  Copyright © 2018 eDynamix Global. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let loopInterval = 0.7
    let shootedMoleCounterMax = 2
    
    var isGameStarted = false
    var timer = Timer()
    var moleHalfWidth: Int = 0
    var moleHalfHeight: Int = 0
    var isPoused = false
    var isMoleShooted = false
    var shootedMoleCounter = 0
    var missedCount = 0
    var succeededCount = 0
    
    @IBOutlet var panningCursor: UIPanGestureRecognizer!
    @IBOutlet weak var cursor: UIImageView!
    @IBOutlet weak var imgMole: UIImageView!
    @IBOutlet weak var imgGround: UIImageView!
    @IBOutlet weak var imgSky: UIImageView!
    @IBOutlet weak var imgPlay: UIImageView!
    @IBOutlet weak var imgPouse: UIImageView!
    @IBOutlet weak var imgBloodSplat: UIImageView!
    @IBOutlet weak var lblMissed: UILabel!
    @IBOutlet weak var lblSucceeded: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        // Set controlls transperacy
        imgPlay.alpha = 0.3
        imgPouse.alpha = 0.3
        
        // Hiding elements
        imgPlay.isHidden = true
        imgPouse.isHidden = true
        imgBloodSplat.isHidden = true
        
        // Generic Screen Center Positioning (Manual)
        centerElement(imgMole)
        centerElement(cursor)
        
        // Move initial gunsight position over the mole (Change Y / Move on Y axis)
        cursor.frame.origin.y -= imgMole.frame.size.height + cursor.frame.size.height / 2
        
        // Programatically (manual) Set Full Screen Size
        imgGround.frame = view.frame
        imgSky.frame = view.frame
        
        // Allow Events over UIImage
        cursor.isUserInteractionEnabled = true
        imgPlay.isUserInteractionEnabled = true
        imgPouse.isUserInteractionEnabled = true
        
        moleHalfWidth = Int(imgMole.frame.width) / 2
        moleHalfHeight = Int(imgMole.frame.height) / 2
    }
    
    func centerElement<T>(_ element: T, width: CGFloat? = nil, height: CGFloat? = nil) where T: UIView {
        let x = view.frame.size.width / 2 - element.frame.size.width / 2
        let y = view.frame.size.height / 2 - element.frame.size.height / 2
        
        element.frame = CGRect(
            x: x,
            y: y,
            width: width ?? element.frame.size.width,
            height: height ?? element.frame.size.height
        )
    }
    
    @IBAction func cursorPanned(_ sender: UIPanGestureRecognizer) {
        cursor.center = sender.location(in: self.view)
    }
    
    @IBAction func cursorTap(_ sender: Any) {
        if !isGameStarted {
            return
        }
        
        if isShotInTarget() {
            // Position the BloodSplat and show it
            imgBloodSplat.frame = imgMole.frame
            imgMole.isHidden = true
            imgBloodSplat.isHidden = false
            isMoleShooted = true
            
            // Stat update
            succeededCount += 1
            lblSucceeded.text = String(succeededCount)
        }
    }
    
    func isShotInTarget() -> Bool {
        return (cursor.frame.origin.x > imgMole.frame.origin.x &&
                    cursor.frame.origin.x < (imgMole.frame.origin.x + imgMole.frame.size.width - cursor.frame.size.width)) &&
                ((cursor.frame.origin.y + cursor.frame.size.height * 0.8) > imgMole.frame.origin.y &&
                    cursor.frame.origin.y < (imgMole.frame.origin.y + imgMole.frame.size.height - cursor.frame.height))
    }
    
    @IBAction func playTap(_ sender: UITapGestureRecognizer) {
        isPoused = false
        imgPlay.isHidden = true
        imgPouse.isHidden = false
    }
    
    @IBAction func pouseTap(_ sender: UITapGestureRecognizer) {
        isPoused = true
        imgPlay.isHidden = false
        imgPouse.isHidden = true
    }
    
    @IBAction func btnStartClick(_ sender: UIButton) {
        isGameStarted = true
        sender.isHidden = true
        imgPouse.isHidden = false
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: loopInterval,
            target: self,
            selector: #selector(timerAction),
            userInfo: nil,
            repeats: true
        )
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    func timerAction() {
        if isPoused {
            return
        }
        
        if isMoleShooted {
            if shootedMoleCounter >= shootedMoleCounterMax {
                shootedMoleCounter = 0
                isMoleShooted = false
                
                imgMole.isHidden = false
                imgBloodSplat.isHidden = true
            } else {
                shootedMoleCounter += 1
                return
            }
        }
        
        imgMole.isHidden = true
        
        let maxMoleX = Int(UIScreen.main.bounds.width) - moleHalfWidth
        let minMoleX = moleHalfWidth
        let maxMoleY = Int(UIScreen.main.bounds.height) - moleHalfHeight
        let minMoleY = Int(UIScreen.main.bounds.height * 0.3)
        
        let randomX = getRandom(min: minMoleX, max: maxMoleX)
        let randomY = getRandom(min: minMoleY, max: maxMoleY)
        
        imgMole.center = CGPoint(x: randomX, y: randomY)
        
        missedCount += 1
        lblMissed.text = String(missedCount)
        
        imgMole.isHidden = false
    }
    
    func getRandom(min: Int, max: Int) -> Int {
        let number = Int(arc4random_uniform(UInt32(UInt(max))))
        
        if number < min {
            return min
        }
        
        return number
    }
}

