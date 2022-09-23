//
//  ConfigViewController.swift
//  AnujavanitShw4
//
//  Created by Sornthorn Anujavanit on 2/22/21.
//

import UIKit

var Channel = 1
var favName = "ABC"
var favSegment = 0
var favChannels = [1, 2, 3, 4]

class ConfigViewController: UIViewController {

    var validName = false
    
    @IBOutlet weak var segmentLabel: UISegmentedControl!
    @IBOutlet weak var textboxLabel: UITextField!
    @IBOutlet weak var chLabel: UILabel!
    @IBOutlet weak var stepperLabel: UIStepper!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func titleInput(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        textboxLabel.resignFirstResponder()
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        Channel = Int(sender.value)
        chLabel.text = "\(Channel)"
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        segmentLabel.selectedSegmentIndex = 0
                Channel = 1
                chLabel.text = "\(Channel)"
                textboxLabel.text = ""
                stepperLabel.value = 1
        
        let title = "Cancel Confirmation"
        let message = "Reset to default"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        validateName(FavoriteName: textboxLabel.text!)
                if validName {
                    Channel = Int(chLabel.text!)!
                    favSegment = segmentLabel.selectedSegmentIndex
                    favName = textboxLabel.text!
                    favChannels[segmentLabel.selectedSegmentIndex] = Channel
                    successMessage()
                    validName = false
                }
                else {
                    textboxLabel.text = ""
                }
    }
    
    func validateName (FavoriteName name: String){
        if name.count > 0 && name.count <= 4 {
                validName = true
            }
            else{
                let title = "Invalid Name"
                let message = "You have entered an invalid name"
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(cancelAction)
                alertController.addAction(okayAction)
                present(alertController, animated: true, completion: nil)
            }
        }
        
        func successMessage() {
            let title = "Save Completed"
            let message = "Your  favorite channel has been saved"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Back", style: .cancel, handler: nil)
            let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            alertController.addAction(okayAction)
            present(alertController, animated: true, completion: nil)
        }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
