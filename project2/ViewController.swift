//
//  ViewController.swift
//  project2
//
//  Created by Dhany Basuki on 3/3/16.
//  Copyright © 2016 Dhany. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria","poland","russia","spain","uk","us"]
        askQuestion()
    }
    
    func askQuestion() {
        if #available(iOS 9.0, *) {
            countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
            correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        } else {
            // Fallback on earlier versions
        }
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        title = countries[correctAnswer].uppercaseString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

