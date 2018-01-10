//
//  ViewController.swift
//  ColdCall
//
//  Created by Song on 1/10/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    let names=["Colleen","Erica","Nifer","Nick","Dominik"]
    var rando=0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        name.isHidden=true
        name.text="Ready?"
//        name.font=UIFont(name:"systemFont",size:32)
        number.isHidden=true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
      
    }
//    @IBOutlet weak var coldCall: UIButton!
    @IBAction func coldCall(_ sender: Any) {
        rando=Int(arc4random()%5)
        updateUI()
    }
    func updateUI(){
        name.text=names[rando]
//        print(name.text)
        number.text=String(rando+1)
//        name.font=UIFont(name:"systemFont",size:64)
        if(rando<2){
            number.textColor = .red
        }else if rando<4{
            number.textColor = .orange
        }else{
            number.textColor = .green
        }
        name.isHidden=false
        number.isHidden=false
    }

}

