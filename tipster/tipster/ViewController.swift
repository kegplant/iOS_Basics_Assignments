//
//  ViewController.swift
//  tipster
//
//  Created by Song on 1/11/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet var tipGroupSmall: [UILabel]!
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    var num=""
    var extraTipPercentage:Double=0
    var groupSize=1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayTips()
    }
    @IBAction func numPadPressed(_ sender: UIButton) {
        num += sender.titleLabel!.text!
        numLabel.text = num
        displayTips()
    }
    @IBAction func clearPressed(_ sender: UIButton) {
        num = ""
        numLabel.text="0"
        displayTips()
    }
    @IBAction func tipSliderChanged(_ sender: UISlider) {
        extraTipPercentage=Double(sender.value)
        displayTips()
    }
    @IBAction func groupSizeSliderChanged(_ sender: UISlider) {
        groupSize=Int(sender.value)
        groupSizeLabel.text = "Group Size: \(groupSize)"
//        print(Int(sender.value))
        displayTips()
    }
    func displayTips(){
        //take care of internal values
        let tipSmall=(0.1+extraTipPercentage)*Double(numLabel.text!)!/Double(groupSize)
        let totalSmall=(1.1+extraTipPercentage)*Double(numLabel.text!)!/Double(groupSize)
        //take care of displays
        tipGroupSmall[0].text = String(Int((0.1+extraTipPercentage)*100))+"%";
        tipGroupSmall[1].text = String(format: "%.2f",tipSmall)
        tipGroupSmall[2].text = String(format: "%.2f",totalSmall)
        print(tipSmall)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

