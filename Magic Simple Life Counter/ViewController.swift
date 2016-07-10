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
    // Locals
    var playerLife = 20
    var opponentLife = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        self.opponentLifeLabel.transform = CGAffineTransformMakeScale(-1, -1);
    }
    
    @IBAction func decreaseOpponentLife() {
        opponentLife -= 1
        opponentLifeLabel.text = String(opponentLife)
    }
    
    @IBAction func increaseOpponentLife() {
        opponentLife += 1
        opponentLifeLabel.text = String(opponentLife)
    }
    
    @IBAction func increasePlayerLife() {
        playerLife += 1
        playerLifeLabel.text = String(playerLife)
    }
    
    @IBAction func decreasePlayerLife() {
        playerLife -= 1
        playerLifeLabel.text = String(playerLife)
    }
}

