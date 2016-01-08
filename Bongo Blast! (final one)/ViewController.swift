//
//  ViewController.swift
//  Bongo Blast! (final one)
//
//  Created by nburns on 12/2/15.
//  Copyright © 2015 nburns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

var number = 0
    

    
    
    
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet var leftTap: UITapGestureRecognizer!
    @IBOutlet var rightTap: UITapGestureRecognizer!
    
    

  
    
    
    var count : Double = 10.0
var shouldUpdate = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        
        
       
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "FreeVector-Jungle-Background")!)
        // Do any additional setup after loading the view, typically from a nib.
     countDownLabel.text = "go"

       
    }

    @IBAction func myStartButton(sender: UIButton) {
       
        
        
        leftTap.enabled = true
        rightTap.enabled = true
        
        count = 10.0
        myLabel.text = " "
        number  = 0
        countDownLabel.text = "go"
        shouldUpdate = true
    
    
    
    }

    func update() {
        
        if !shouldUpdate{
            return
        }
        if(count >= 0.1)
        {
            count -= 0.1
            countDownLabel.text = String(format: "%.1f", count)
            
        }
        else
        {
            shouldUpdate = false
            countDownLabel.text = "Over"
            TimeOver()
            leftTap.enabled = false
            rightTap.enabled = false
            
            
        }
    }
    
    
    func TimeOver()
    {
        let alert = UIAlertController(title: "\(number)!", message: "You're really good!", preferredStyle: UIAlertControllerStyle.Alert)
        let resetButton = UIAlertAction(title: "Play Again?", style: UIAlertActionStyle.Default, handler: {sender in
            
            self.myLabel.text = " "
            self.number = 0
            self.leftTap.enabled = true
            self.rightTap.enabled = true
            self.count = 0
            self.countDownLabel.text = "go"
            
           
            
            
            
            
            
            
           })
        
        alert.addAction(resetButton)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    @IBAction func TapLeft(sender: UITapGestureRecognizer) {
   number++
        
        myLabel.text = "\(number)"

    }
    @IBAction func tapRight(sender: UITapGestureRecognizer) {
    number++
        myLabel.text = "\(number)"
       
    }
}

