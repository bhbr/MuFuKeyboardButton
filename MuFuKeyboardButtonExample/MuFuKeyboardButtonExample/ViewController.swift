//
//  ViewController.swift
//  MuFuKeyboardButtonExample
//
//  Created by Ben Hambrecht on 04.03.17.
//  Copyright © 2017 Ben Hambrecht. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MFKBDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myButton = MuFuKeyboardButton()
        myButton.inputID = "x"
        myButton.displayLabel.text = "x"
        myButton.inputOptionsIDs = ["a", "b", "c"]
        myButton.delegate = self
        
        self.view.addSubview(myButton)
        
        let myButton2 = MuFuKeyboardButton()
        myButton2.frame = CGRect(x: 150.0, y: 150.0, width: myButton2.frame.size.width, height: myButton2.frame.size.height)
        myButton2.inputID = "y"
        myButton2.displayImageView.image = UIImage(named: "sqrt_iPhone")
        myButton2.magnifiedDisplayImageView.image = UIImage(named: "sqrt_iPhone")
        myButton2.displayType = .Image
        myButton2.inputOptionsIDs = ["A", "B", "🤡"]
        myButton2.inputOptionsImages = [UIImage(named: "sqrt_iPhone")!, UIImage(named: "sqrt_iPhone")!, UIImage(named: "sqrt_iPhone")!]
        myButton2.delegate = self
        
        self.view.addSubview(myButton2)
        self.view.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handleKeyboardEvent(_ id: String) {
        if (id == "x") {
            NSLog("event x detected")
        } else if (id == "a") {
            NSLog("event a detected")
        } else if (id == "b") {
            NSLog("event b detected")
        } else if (id == "c") {
            NSLog("event c detected")
        } else if (id == "y") {
            NSLog("event y detected")
        } else if (id == "A") {
            NSLog("event A detected")
        } else if (id == "B") {
            NSLog("event B detected")
        } else if (id == "🤡") {
            NSLog("event 🤡 detected")
        } else {
            NSLog("other event detected")
        }
    }
    
    
    @IBAction func functionButtonTouchDown(_ sender: MuFuButton) {
        NSLog("function button touch down")
    }
    
    @IBAction func buttonQPressed(_ sender: MuFuButton!) {
        NSLog(sender.currentTitle!)
    }
    
    @IBOutlet var muFuButton: MuFuButton?
    
    @IBAction func interrupt() {
        
    }
    
}

