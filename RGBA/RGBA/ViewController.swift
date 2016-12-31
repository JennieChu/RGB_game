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

    var correctAnswer = 0
    var colorsToChoose = [UIColor]()
    var score: Int = 0
    {
        didSet
        {
            scoreCount.text = "Score: \(score)"
        }
    }

    // viewDidLoad - initial setup after view loads
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        score = 0
        modifyButtonDesign(ogColor, colorOne, colorTwo, colorThree)
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

    @IBAction func buttonTapped(_ sender: UIButton)
    {
        if sender.tag == correctAnswer
        {
            title = "Correct!"
            colorsToChoose.removeAll()
            nextRound(action: nil)
            score += 1
        }
        else
        {
            title = ""
            // create an alert to notify game over
            let ac = UIAlertController(title: "Game Over", message: "Your score was \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: nextRound))
            present(ac, animated: true)
            endGame()
        }
        colorsToChoose.removeAll()

    }
    
    func endGame()
    {
        score = 0;
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

