//
//  ViewController.swift
//  AnujavanitShw4
//
//  Created by Sornthorn Anujavanit on 2/1/21.
//

import UIKit

class TVviewcontroller: UIViewController {
    
    var numArr: [String] = []
    
    @IBOutlet weak var tvPower: UILabel!
    @IBOutlet weak var vol: UILabel!
    @IBOutlet weak var channel: UILabel!
    @IBOutlet weak var onOff: UISwitch!
    @IBOutlet weak var slide: UISlider!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var chPlus: UIButton!
    @IBOutlet weak var chSub: UIButton!
    @IBOutlet weak var favCh: UISegmentedControl!
    
    @IBAction func onOffPress(_ sender: UISwitch) {
        tvPower.text = (sender.isOn ? "On" : "Off")
        onOff.setOn(sender.isOn, animated: true)
        
        if sender.isOn == true{
            tvPower.text = "On"
            vol.isEnabled = true
            zero.isEnabled = true
            one.isEnabled = true
            two.isEnabled = true
            three.isEnabled = true
            four.isEnabled = true
            five.isEnabled = true
            six.isEnabled = true
            seven.isEnabled = true
            eight.isEnabled = true
            nine.isEnabled = true
            chPlus.isEnabled = true
            chSub.isEnabled = true
            favCh.isEnabled = true
        }
        else{
            tvPower.text = "Off"
            vol.isEnabled = false
            zero.isEnabled = false
            one.isEnabled = false
            two.isEnabled = false
            three.isEnabled = false
            four.isEnabled = false
            five.isEnabled = false
            six.isEnabled = false
            seven.isEnabled = false
            eight.isEnabled = false
            nine.isEnabled = false
            chPlus.isEnabled = false
            chSub.isEnabled = false
            favCh.isEnabled = false
        }
    }
    
    @IBAction func slideAction(_ sender: UISlider) {
        vol.text = "\(Int(sender.value))"
    }
    
    @IBAction func numPress(_ sender: UIButton) {
        let num: String = sender.currentTitle!
        
        if numArr.count == 0 || numArr.count == 1{
            numArr.append(num)
        }
        if numArr.count == 2{
            let newCh = numArr[0] + numArr[1]
            
            if newCh == "00" {
                numArr.removeAll()
            }
            else{
                channel.text = newCh
                numArr.removeAll()
            }
        }
    }
    
    @IBAction func channelPlus(_ sender: UIButton) {
        let num = Int(channel.text!)!
        if num > 99 || num == 99{
            channel.text = "\(num)"
        }
        else{
            channel.text = "\(num + 1)"
        }
    }
    
    @IBAction func channelSub(_ sender: UIButton) {
        let num = Int(channel.text!)!
        if num < 1 || num == 1{
            channel.text = "\(num)"
        }
        else{
            channel.text = "\(num - 1)"
        }
    }
    
    @IBAction func favChannel(_ sender: UISegmentedControl) {
        /*if sender.titleForSegment(at: sender.selectedSegmentIndex) == "ABC"{
            channel.text = "1"
        }
        if sender.titleForSegment(at: sender.selectedSegmentIndex) == "NBC"{
            channel.text = "2"
        }
        if sender.titleForSegment(at: sender.selectedSegmentIndex) == "CBS"{
            channel.text = "3"
        }
        if sender.titleForSegment(at: sender.selectedSegmentIndex) == "FOX"{
            channel.text = "4"
        }
        */
        let index = sender.selectedSegmentIndex
                
                switch index {
                case 0:
                    Channel = favChannels[index]
                    channel.text = "\(Channel)"
                    break
                case 1:
                    Channel = favChannels[index]
                    channel.text =  "\(Channel)"
                    break
                case 2:
                    Channel = favChannels[index]
                    channel.text =  "\(Channel)"
                    break
                case 3:
                    Channel = favChannels[index]
                    channel.text =  "\(Channel)"
                    break
                default:
                    break
                }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            favCh.setTitle(favName, forSegmentAt: favSegment)
        }


}

