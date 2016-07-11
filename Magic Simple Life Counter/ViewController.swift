//
//  ViewController.swift
//  Magic Simple Life Counter
//
//  Created by Eduardo Cobuci on 7/9/16.
//  Copyright © 2016 Eduardo Cobuci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var opponentLifeLabel: UILabel!
    @IBOutlet weak var playerLifeLabel: UILabel!
    @IBOutlet weak var playerDeltaLabel: UILabel!
    @IBOutlet weak var opponentDeltaLabel: UILabel!
    var playerDeltaTimer: NSTimer?
    var opponentDeltaTimer: NSTimer?
    
    // Locals
    let flipTransform = CGAffineTransformMakeScale(-1, -1);
    let DELTA_INTERVAL_IN_SECONDS: Double = 1.5
    var playerLife = 20
    var opponentLife = 20
    var playerDelta = 0
    var opponentDelta = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.opponentLifeLabel.transform = flipTransform
        self.opponentDeltaLabel.transform = flipTransform
    }
    
    @IBAction func decreaseOpponentLife() {
        opponentLife -= 1
        opponentDelta -= 1
        opponentLifeLabel.text = String(opponentLife)
        showOpponentDelta()
    }
    
    @IBAction func increaseOpponentLife() {
        opponentLife += 1
        opponentDelta += 1
        opponentLifeLabel.text = String(opponentLife)
        showOpponentDelta()
    }
    
    @IBAction func increasePlayerLife() {
        playerLife += 1
        playerDelta += 1
        playerLifeLabel.text = String(playerLife)
        showPlayerDelta()
    }
    
    @IBAction func decreasePlayerLife() {
        playerLife -= 1
        playerDelta -= 1
        playerLifeLabel.text = String(playerLife)
        showPlayerDelta()
    }
    
    @IBAction func reset() {
        playerLife = 20
        playerLifeLabel.text = String(playerLife)
        opponentLife = 20
        opponentLifeLabel.text = String(opponentLife)
    }
    
    func showPlayerDelta () {
        self.playerDeltaLabel.hidden = false
        if playerDelta >= 0 {
            self.playerDeltaLabel.text = "+\(playerDelta)"
            self.playerDeltaLabel.textColor = UIColor.blueColor()
        } else {
            self.playerDeltaLabel.text = String(playerDelta)
            self.playerDeltaLabel.textColor = UIColor.redColor()
        }
        self.playerDeltaTimer?.invalidate()
        playerDeltaTimer = NSTimer.scheduledTimerWithTimeInterval(DELTA_INTERVAL_IN_SECONDS,
                                                       target: self,
                                                       selector: #selector(ViewController.hidePlayerDelta),
                                                       userInfo: nil,
                                                       repeats: false)
    }
    
    func hidePlayerDelta() {
        playerDelta = 0
        self.playerDeltaLabel.hidden = true
    }
    
    func showOpponentDelta () {
        self.opponentDeltaLabel.hidden = false
        if opponentDelta >= 0 {
            self.opponentDeltaLabel.text = "+ \(opponentDelta)"
            self.opponentDeltaLabel.textColor = UIColor.blueColor()
        } else {
            self.opponentDeltaLabel.text = String(opponentDelta)
            self.opponentDeltaLabel.textColor = UIColor.redColor()
        }
        self.opponentDeltaTimer?.invalidate()
        opponentDeltaTimer = NSTimer.scheduledTimerWithTimeInterval(DELTA_INTERVAL_IN_SECONDS,
                                                                  target: self,
                                                                  selector: #selector(ViewController.hideOpponentDelta),
                                                                  userInfo: nil,
                                                                  repeats: false)
    }
    
    func hideOpponentDelta() {
        opponentDelta = 0
        self.opponentDeltaLabel.hidden = true
    }
}

