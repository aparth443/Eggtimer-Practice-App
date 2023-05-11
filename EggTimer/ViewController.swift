//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft":300,"Medium":420,"Hard":720]
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var secondsRemaining : Int = 60
    var totalSeconds = 0
    var timer = Timer()
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //titleLabel.text = "How do you like your eggs?"
        timer.invalidate()
        secondsRemaining = eggTimes[sender.currentTitle!]!
        totalSeconds = eggTimes[sender.currentTitle!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter(){
        if secondsRemaining>0{
            print("\(secondsRemaining) Seconds")
            secondsRemaining -= 1
            progressBar.progress = Float(totalSeconds - secondsRemaining)/Float(totalSeconds)
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    

}
