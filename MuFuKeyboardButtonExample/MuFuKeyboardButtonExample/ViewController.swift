//
//  ViewController.swift
//  MuFuKeyboardButtonExample
//
//  Created by Ben Hambrecht on 04.03.17.
//  Copyright © 2017 Ben Hambrecht. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MuFuKeyDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let myButton = MuFuKeyboardButton()
//        myButton.inputID = "x"
//        myButton.displayLabel.text = "x"
//        myButton.inputOptionsIDs = ["a", "b", "c"]
//        myButton.delegate = self
//        myButton.frame = CGRect(x: 100.0, y: 150.0, width: myButton.frame.size.width, height: myButton.frame.size.height)
//        
//        self.view.addSubview(myButton)
//        
//        let myButton2 = MuFuKeyboardButton()
//        myButton2.frame = CGRect(x: 150.0, y: 150.0, width: myButton2.frame.size.width, height: myButton2.frame.size.height)
//        myButton2.inputID = "y"
//        myButton2.displayImageView.image = UIImage(named: "sqrt_iPhone")
//        myButton2.magnifiedDisplayImageView.image = UIImage(named: "sqrt_iPhone")
//        myButton2.displayType = .Image
//        myButton2.inputOptionsIDs = ["A", "B", "🤡"]
//        myButton2.inputOptionsImages = [UIImage(named: "sqrt_iPhone")!, UIImage(named: "sqrt_iPhone")!, UIImage(named: "sqrt_iPhone")!]
//        myButton2.delegate = self
//
//        self.view.addSubview(myButton2)
//        self.view.setNeedsDisplay()
        
        
        let myKey = MuFuKey(frame: CGRect(x: 50, y: 150,width: 30,height: 45))
        myKey.style = "Character"
        myKey.symbolText = "€"
        myKey.inputID = "x"
        myKey.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handleKeyboardEvent(_ id: String) {
        if (id == "test") {
            NSLog("test event detected")
        } else {
            NSLog("other event detected")
        }
    }
    
    
    @IBAction func functionButtonTouchDown(_ sender: MuFuKey) {
        NSLog("function button touch down")
    }
    
    @IBAction func buttonQPressed(_ sender: MuFuKey!) {
        NSLog(sender.inputID)
    }
    
    @IBOutlet var muFuButton: MuFuKey?
    
    @IBAction func interrupt() {
        
    }
    
}

