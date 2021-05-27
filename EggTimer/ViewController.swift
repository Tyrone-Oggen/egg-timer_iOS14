//
//  ViewController.swift
//  EggTimer
//
//  Created by Tyrone Oggen on 2021/05/01.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    //Three separate constants
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    //Dictionary
    var eggTimes = [
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        timer.invalidate()
        
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        timerLabel.text = hardness
        
        
        //If Statement
//        if (hardness.lowercased() == "soft") {
//            print(softTime)
//        } else if (hardness.lowercased() == "medium") {
//            print(mediumTime)
//        } else {
//            print(hardTime)
//        }
        
        
        //Case statement
//        switch hardness.lowercased() {
//        case "soft":
//            print(softTime)
//        case "medium":
//            print(mediumTime)
//        case "hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }
        
        
        //Dictionary
//        let result = eggTimes[hardness]!
//
//        print(result)
        
        
        
        
        //Timer method 1
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
//            if self.secondsPassed < self.totalTime {
//                self.secondsPassed += 1
//                self.progressBar.progress = Float(self.secondsPassed) / Float(self.totalTime)
//            } else {
//                self.timer.invalidate()
//                self.timerLabel.text = "Done"
//                self.playSound()
//            }
//        }

        
        //Timer method 2
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    
    //Timer method 2
    @objc func updateCounter() {
        //example functionality
        if self.secondsPassed < self.totalTime  {
            secondsPassed += 1
            progressBar.progress = Float(self.secondsPassed) / Float(self.totalTime)
        } else {
            timer.invalidate()
            timerLabel.text = "Done"
            playSound()
        }
    }
    
    
    
    //Play Sound function
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}
