//
//  ViewController.swift
//  ReplyKit Microphone Access App
//
//  Created by eDynamix Global on 02/08/2018.
//  Copyright © 2018 eDynamix Global. All rights reserved.
//

import UIKit
import ReplayKit

class ViewController: UIViewController, RPPreviewViewControllerDelegate {
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var imagePicker: UISegmentedControl!
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var micToggle: UISwitch!
    @IBOutlet weak var recordBtn: UIButton!
    
    var recorder = RPScreenRecorder.shared()
    var isRecording = false
    
    @IBAction func imagePicked(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedImageView.image = UIImage(named: "skate")!
        case 1:
            selectedImageView.image = UIImage(named: "food")!
        case 2:
            selectedImageView.image = UIImage(named: "cat")!
        case 3:
            selectedImageView.image = UIImage(named: "nature")!
        default:
            selectedImageView.image = UIImage(named: "skate")
        }
    }
    
    @IBAction func recordBtnTap(_ sender: UIButton) {
        if isRecording {
            startRecording()
        } else {
            stopRecording()
        }
    }
    
    func startRecording() {
        guard recorder.isAvailable else {
            print("Recording is not possible at this time.")
            return
        }
        
        if micToggle.isOn {
            recorder.isMicrophoneEnabled = true
        } else {
            recorder.isMicrophoneEnabled = false
        }
        
        recorder.startRecording { (error) in
            guard error == nil else {
                print("Recording raised an error")
                return
            }
            
            print("Recording Started Successfully!")
            
            DispatchQueue.main.async {
                self.micToggle.isEnabled = false
                self.recordBtn.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: UIControlState.normal)
                self.recordBtn.setTitle("Stop", for: UIControlState.normal)
                self.statusLbl.text = "Recording..."
                self.statusLbl.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                self.isRecording = true
            }
        }
    }
    
    func stopRecording() {
        recorder.stopRecording { (preview, error) in
            guard preview != nil else {
                print("Preview controller is not available!")
                return
            }
            
            let alert = UIAlertController(title: "Delete", message: "Would you like to Edit or Delete your recording?", preferredStyle: UIAlertControllerStyle.alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive, handler: { (action) in
                self.recorder.discardRecording {
                    print("Recording succesfully deleted.")
                }
            })
            
            let editAction = UIAlertAction(title: "Edit", style: UIAlertActionStyle.default, handler: { (action) in
                preview?.previewControllerDelegate = self
                self.present(preview!, animated: true, completion: nil)
            })
            
            alert.addAction(deleteAction)
            alert.addAction(editAction)
            self.present(alert, animated: true, completion: nil)
            
            self.isRecording = false
            self.viewReset()
        }
    }
    
    func viewReset() {
        micToggle.isEnabled = true
        statusLbl.text = "Ready to Record"
        statusLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        recordBtn.setTitle("Record", for: UIControlState.normal)
        recordBtn.setTitleColor(#colorLiteral(red: 0.2449921229, green: 0.6791521256, blue: 0.2991436346, alpha: 1), for: UIControlState.normal)
    }
    
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        dismiss(animated: true, completion: nil)
    }
}

