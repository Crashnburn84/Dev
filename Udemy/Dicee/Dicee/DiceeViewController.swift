//  DiceeViewController.swift
//  Dicee.app
//  Created by Robert Koprowski on 8/5/18.
//  Copyright © 2018 Robert Koprowski. All rights reserved.

import UIKit

class ViewController: UIViewController
{
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDiceImages()
        
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton)
    {
        updateDiceImages()
        
        print(randomDiceIndex1 + 1)
        print(randomDiceIndex2 + 1)
    }
    
    func updateDiceImages() {
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
    }
}

