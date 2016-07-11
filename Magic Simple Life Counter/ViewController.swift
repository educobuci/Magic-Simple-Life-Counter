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
        tickOpponentLife(-1)
    }
    
    @IBAction func increaseOpponentLife() {
        tickOpponentLife(1)
    }
    
    func tickOpponentLife(value: Int) {
        opponentLife += value
        opponentDelta += value
        opponentLifeLabel.text = String(opponentLife)
        showDelta(&opponentDeltaTimer,
                          deltaValue: self.opponentDelta,
                          deltaLabel: self.opponentDeltaLabel,
                          hideSelector: #selector(ViewController.hideOpponentDelta))
    }
    
    @IBAction func increasePlayerLife() {
        tickPlayerLife(1)
    }
    
    @IBAction func decreasePlayerLife() {
        tickPlayerLife(-1)
    }
    
    func tickPlayerLife(value: Int) {
        playerLife += value
        playerDelta += value
        playerLifeLabel.text = String(playerLife)
        showDelta(&playerDeltaTimer,
                  deltaValue: self.playerDelta,
                  deltaLabel: self.playerDeltaLabel,
                  hideSelector: #selector(ViewController.hidePlayerDelta))
    }
    
    @IBAction func reset() {
        playerLife = 20
        playerLifeLabel.text = String(playerLife)
        opponentLife = 20
        opponentLifeLabel.text = String(opponentLife)
    }
    
    func hidePlayerDelta() {
        playerDelta = 0
        self.playerDeltaLabel.hidden = true
    }
    
    func hideOpponentDelta() {
        opponentDelta = 0
        self.opponentDeltaLabel.hidden = true
    }
    
    func showDelta (inout timer: NSTimer?, deltaValue: Int, deltaLabel: UILabel, hideSelector: Selector) {
        deltaLabel.hidden = false
        if deltaValue >= 0 {
            deltaLabel.text = "+\(deltaValue)"
            deltaLabel.textColor = UIColor.blueColor()
        } else {
            deltaLabel.text = String(deltaValue)
            deltaLabel.textColor = UIColor.redColor()
        }
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(DELTA_INTERVAL_IN_SECONDS,
                                                                  target: self,
                                                                  selector: hideSelector,
                                                                  userInfo: nil,
                                                                  repeats: false)
    }
    
    
}

