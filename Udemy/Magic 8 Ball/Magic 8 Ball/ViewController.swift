//  ViewController.swift
//  Magic 8 Ball.app
//  Created by Robert Koprowski on 9/4/18.
//  Copyright © 2018 Robert Koprowski. All rights reserved.

import UIKit

class ViewController: UIViewController
{
    var randomBallNumber: Int = 0
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBallImages()
    }
    
    @IBOutlet weak var ballImage: UIImageView!
    
    @IBAction func askButtonPressed(_ sender: Any) {
        updateBallImages()
    }
    
    func updateBallImages() {
        randomBallNumber = Int(arc4random_uniform(5))
        
//        ballImage.image = UIImage(named: "ball\(randomBallNumber)")
        ballImage.image = UIImage(named: ballArray[randomBallNumber])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateBallImages()
    }
}

