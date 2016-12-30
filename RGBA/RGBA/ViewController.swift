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
        let color1 = 0.5
        // set colors
        ogColor.backgroundColor = UIColor(red: CGFloat(color1), green: 0.6, blue: 0.2, alpha: 1.0)
        colorOne.layer.backgroundColor = UIColor.brown.cgColor
        colorTwo.layer.backgroundColor = UIColor.cyan.cgColor
        colorThree.layer.backgroundColor = UIColor.darkGray.cgColor
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

