//  ViewController.swift
//  Magic 8 Ball.app
//  Created by Robert Koprowski on 9/4/18.
//  Copyright © 2018 Robert Koprowski. All rights reserved.

import UIKit

class ViewController: UIViewController
{
    var randomBallIndex: Int = 0
    
    let ballArray = ["ball", "ball2", "ball3", "ball4", "ball5"]
    
    @IBOutlet weak var ballImage: UIImageView!
    
    @IBAction func askButtonPressed(_ sender: Any) {
        
    }
    
}

