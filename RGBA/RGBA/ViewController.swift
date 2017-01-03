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
    @IBOutlet weak var infoButton: UIBarButtonItem!
    @IBOutlet weak var buttonInfo: UILabel!

    var isHidden = false
    var colorsToChoose = [UIColor]()
    var correctAnswer = 0
    var score: Int = 0
    {
        didSet
        {
            scoreCount.text = "Score: \(score)"
        }
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        buttonInfo.isHidden = true
        score = 0
        modifyButtonDesign(ogColor, colorOne, colorTwo, colorThree)
        nextRound(action: nil)
    }
    
    /// initializes the next round to play, gets another color and 2 similar colors
    ///
    /// - Parameter action: action for when game is over, an alert is sent to user
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

    /// checks whether the user chose the correct answer, if wrong, initializes Game Over sequence
    ///
    /// - Parameter sender: the button the user tapped
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
            let ac = UIAlertController(title: "Game Over", message: "Your score was \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: nextRound))
            present(ac, animated: true)
            endGame()
        }
        colorsToChoose.removeAll()
    }
    
    /// Game Over sequence: resets score and update highscore if necessary
    func endGame()
    {
        let defaults = UserDefaults.standard
        let highScore = defaults.integer(forKey: "highScore")
        if score > highScore
        {
            defaults.set(self.score, forKey: "highScore")
        }
        score = 0;
    }
    
    /// Action when info button is tapped
    /// Hides the scoreCount label and reveals the how to play infomation
    /// - Parameter sender: <#sender description#>
    @IBAction func infoTapped(_ sender: UIButton)
    {
        buttonInfo.isHidden = !buttonInfo.isHidden
        scoreCount.isHidden = !scoreCount.isHidden
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

