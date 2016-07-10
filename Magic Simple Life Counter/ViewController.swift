//
//  ViewController.swift
//  Magic Simple Life Counter
//
//  Created by Eduardo Cobuci on 7/9/16.
//  Copyright © 2016 Eduardo Cobuci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var opponentLifeLabel: UILabel!
    @IBOutlet weak var playerLifeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.opponentLifeLabel.transform = CGAffineTransformMakeScale(-1, -1);
    }
}

