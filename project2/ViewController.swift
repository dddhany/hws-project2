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
    @IBOutlet weak var scoreLabel: UILabel!
    
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
    
    func askQuestion(action: UIAlertAction! = nil) {
        if #available(iOS 9.0, *) {
            countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
            correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        } else {
            countries.shuffle()
        }
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        title = countries[correctAnswer].uppercaseString
    }

    @IBAction func buttonTapped(sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        /*
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
        */
        scoreLabel.text = "\(title). Your score is \(score)."
        askQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension Array {
    mutating func shuffle() {
        for i in 0 ..< (count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

