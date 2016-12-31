//

//  ViewController.swift
//  RGBA
//
//  Created by Jennie on 12/29/16.
//  Copyright © 2016 Jennie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ogColor: UILabel!
    @IBOutlet weak var colorOne: UIButton!
    @IBOutlet weak var colorTwo: UIButton!
    @IBOutlet weak var colorThree: UIButton!
    @IBOutlet weak var scoreCount: UILabel!
    var guesses = [String]()
    var score = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // get random RGB values

        // set colors by: red: CGFloat(variable name)
        let mainColor : UIColor = getRandomColor()
        ogColor.backgroundColor = mainColor
        colorOne.layer.backgroundColor = UIColor(red:0.5, green: 0.62, blue: 0.2, alpha: 1.0).cgColor
        colorTwo.layer.backgroundColor = UIColor(red:0.5, green: 0.63, blue: 0.2, alpha: 1.0).cgColor
        colorThree.layer.backgroundColor = UIColor(red:0.5, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        //nextCompare() - gets the next set of color blocks
        
    }
    
    func getRandomColor() -> UIColor
    {
        let red : CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let blue : CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let green : CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

