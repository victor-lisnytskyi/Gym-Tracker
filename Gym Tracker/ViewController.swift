//
//  ViewController.swift
//  Gym Tracker
//
//  Created by Victor Mac on 04.12.2019.
//  Copyright © 2019 Victor Lisnytskyi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainSecondsLabel: UILabel!
    @IBOutlet weak var setsCountLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    var player: AVAudioPlayer!
    var secondsRemaining = 0
    var secondsToRest = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainSecondsLabel.text = "60"
    }

    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        if timer.isValid {
            // checking if timer is currently running to do nothing if it is
        } else {
        secondsToRest = Int(mainSecondsLabel.text!)!
        secondsRemaining = secondsToRest
            
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCounting), userInfo: nil, repeats: true)
        }
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        mainSecondsLabel.text = String(secondsToRest)
        setsCountLabel.text = "1"
        progressBar.progress = 1
    }
    
    
    @objc func startCounting() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            mainSecondsLabel.text = String(secondsRemaining)
            progressBar.progress = Float(secondsRemaining)/Float(secondsToRest)

        } else {
            timer.invalidate()
            mainSecondsLabel.text = String(secondsToRest)
            var tempCount = Int(setsCountLabel.text!)!
            tempCount += 1
            setsCountLabel.text = String(tempCount)
            progressBar.progress = 1
            
            let url = Bundle.main.url(forResource: "alarm", withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    
    @IBAction func updateSecondsButtonsPressed(_ sender: UIButton) {
        if timer.isValid {
            // checking if timer is currently running to do nothing if it is
        } else {
            var tempCount = Int(mainSecondsLabel.text!)!
            if sender.currentTitle == "+" {tempCount += 1} else {tempCount -= 1}
            mainSecondsLabel.text = String(tempCount)
        }
    }
}
