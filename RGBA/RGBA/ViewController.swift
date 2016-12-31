//

//  ViewController.swift
//  RGBA
//
//  Created by Jennie on 12/29/16.
//  Copyright © 2016 Jennie. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController
{
    @IBOutlet weak var ogColor: UILabel!
    @IBOutlet weak var colorOne: UIButton!
    @IBOutlet weak var colorTwo: UIButton!
    @IBOutlet weak var colorThree: UIButton!
    @IBOutlet weak var scoreCount: UILabel!
    var colorsToChoose = [UIColor]()
    var score: Int = 0
    {
        didSet
        {
            scoreCount.text = "Score: \(score)"
        }
    }
    var correctAnswer = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()
        score = 0
        
        ogColor.layer.cornerRadius = 5
        ogColor.layer.masksToBounds = true
        
        colorOne.layer.shadowColor = UIColor.black.cgColor
        colorOne.layer.shadowOffset = CGSize(width: 5, height: 5)
        colorOne.layer.shadowRadius = 5
        colorOne.layer.shadowOpacity = 0.2
        colorOne.layer.cornerRadius = 5
        colorOne.layer.masksToBounds = false
        
        colorTwo.layer.shadowColor = UIColor.black.cgColor
        colorTwo.layer.shadowOffset = CGSize(width: 5, height: 5)
        colorTwo.layer.shadowRadius = 5
        colorTwo.layer.shadowOpacity = 0.2
        colorTwo.layer.cornerRadius = 5
        colorTwo.layer.masksToBounds = false
        
        colorThree.layer.shadowColor = UIColor.black.cgColor
        colorThree.layer.shadowOffset = CGSize(width: 5, height: 5)
        colorThree.layer.shadowRadius = 5
        colorThree.layer.shadowOpacity = 0.2
        colorThree.layer.cornerRadius = 5
        colorThree.layer.masksToBounds = false
        
        
        nextRound(action: nil)
    }
    
    func nextRound(action: UIAlertAction!)
    {
        let mainColor: UIColor = getRandomColor()
        let simColorOne: UIColor = mainColor.getSimilarColor()
        let simColorTwo: UIColor = mainColor.getSimilarColor()


        colorsToChoose += [simColorOne, simColorTwo, mainColor]
        colorsToChoose = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: colorsToChoose) as! [UIColor]
        
        colorOne.layer.backgroundColor = colorsToChoose[0].cgColor
        colorTwo.layer.backgroundColor = colorsToChoose[1].cgColor
        colorThree.layer.backgroundColor = colorsToChoose[2].cgColor
        

        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        ogColor.backgroundColor = colorsToChoose[correctAnswer]
    }
    
    func getRandomColor() -> UIColor
    {
        let red : CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let blue : CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let green : CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    @IBAction func buttonTapped(_ sender: UIButton)
    {
        if sender.tag == correctAnswer
        {
            // title = "Correct"
            title = "Correct!"
            colorsToChoose.removeAll()
            nextRound(action: nil)
            score += 1
        }
        else
        {
            title = ""
            let ac = UIAlertController(title: "Game Over", message: "Your score was \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: nextRound))
            present(ac, animated: true)
            score = 0
        }
        colorsToChoose.removeAll()

    }
    

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

