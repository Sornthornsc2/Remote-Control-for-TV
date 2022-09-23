//
//  DVRViewController.swift
//  AnujavanitShw4
//
//  Created by Sornthorn Anujavanit on 2/16/21.
//

import UIKit

class DVRviewcontroller: UIViewController {
    
    var state = "Stopped"

    @IBOutlet weak var DVRPowerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var DVRSwitch: UISwitch!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var FFButton: UIButton!
    @IBOutlet weak var FRButton: UIButton!
    @IBOutlet weak var recButton: UIButton!
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        DVRPowerLabel.text = (sender.isOn ? "On" : "Off")
        DVRSwitch.setOn(sender.isOn, animated: true)
        
        if sender.isOn == true{
            DVRPowerLabel.text = "On"
            stateLabel.text = "Stopped"
            playButton.isEnabled = true
            stopButton.isEnabled = true
            pauseButton.isEnabled = true
            FFButton.isEnabled = true
            FRButton.isEnabled = true
            recButton.isEnabled = true
        }
        else{
            DVRPowerLabel.text = "Off"
            playButton.isEnabled = false
            stopButton.isEnabled = false
            pauseButton.isEnabled = false
            FFButton.isEnabled = false
            FRButton.isEnabled = false
            recButton.isEnabled = false
        }
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        if state == "Play" || state == "Pause" || state == "Stopped" || state == "Fast Forward" || state == "Fast Rewind" {
            state = "Play"
            stateLabel.text = "\(state)"
        }
        else {
            generateAlert(message: "Invalid operation. Do you want to force play?", forceStateTo: "Play")
        }
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        state = "Stopped"
        stateLabel.text = "\(state)"    }
    
    @IBAction func pausePressed(_ sender: UIButton) {
        if state == "Play" || state == "Pause" {
            state = "Pause"
            stateLabel.text = "\(state)"
        }
        else {
            generateAlert(message: "Invalid operation. Do you want to force pause?", forceStateTo: "Pause")
        }
    }
    
    @IBAction func ffPressed(_ sender: UIButton) {
        if state == "Play" || state == "Fast Forward" {
            state = "Fast Forward"
            stateLabel.text = "\(state)"
        }
        else {
            generateAlert(message: "Invalid operation. Do you want to fast forward?", forceStateTo: "Fast Forward")
        }
    }
    
    @IBAction func frPressed(_ sender: UIButton) {
        if state == "Play" || state == "Fast Rewind" {
            state = "Fast Rewind"
            stateLabel.text = "\(state)"
        }
        else {
            generateAlert(message: "Invalid operation. Do you want to force fast rewind?", forceStateTo: "Fast Rewind")
        }
    }
    
    @IBAction func recPressed(_ sender: UIButton) {
        if state == "Stopped"  {
            state = "Recording"
            stateLabel.text = "\(state)"
        }
        else {
            generateAlert(message: "Invalid operation. Do you want to force record?", forceStateTo: "Recording")
        }
    }

    func generateAlert(message: String, forceStateTo: String) {
        let message = message
        let alertController = UIAlertController(title: "Invalid Operation", message: message, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { action in
            let cancelController = UIAlertController(title: "Cancel Confirmation", message: "Action Cancelled", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            cancelController.addAction(okayAction)
            self.present(cancelController, animated: true, completion: nil)
        }
        
        let forceAction = UIAlertAction(title: "Force", style: .default) { action in
            self.state = forceStateTo
            let forceController = UIAlertController(title: "Force Operation Confirmation", message: "Current operation stopped, requested operation proceding", preferredStyle: .alert)
            let forceAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            forceController.addAction(forceAction)
            self.present(forceController, animated: true, completion: nil)
            self.stateLabel.text = "\(forceStateTo)"
        }
        alertController.addAction(forceAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchToTV(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
