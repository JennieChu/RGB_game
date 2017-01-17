//
//  ViewController2.swift
//  RGBA
//
//  Created by Jennie on 1/3/17.
//  Copyright © 2017 Jennie. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var highScore: Int?
    var score: Int?
    @IBOutlet weak var yourScore: UILabel!
    @IBOutlet weak var endHighScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        yourScore.text = "Your Score: \(score!)"
        endHighScore.text = "High Score: \(highScore!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
