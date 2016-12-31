//
//  helper.swift
//  RGBA
//
//  Created by Jennie on 12/31/16.
//  Copyright © 2016 Jennie. All rights reserved.
//

import Foundation
import UIKit

// getRandomColor - gets a random RGB color
// Returns: a UIColor with the randomize RGB Values, alpha is always set to one

func getRandomColor() -> UIColor
{
    let red : CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
    let blue : CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
    let green : CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
    
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
}

// modifyButtonDesign - modifies the display of all buttons and labels
// @ogColor: original color to match with
// @colorOne: first button option
// @colorTwo: second button option
// @colorThree: third button option

func modifyButtonDesign(_ ogColor: UILabel?, _ colorOne: UIButton?, _ colorTwo: UIButton?, _ colorThree: UIButton?)
{
    ogColor!.layer.cornerRadius = 5
    ogColor!.layer.masksToBounds = true
    
    colorOne!.layer.shadowColor = UIColor.black.cgColor
    colorOne!.layer.shadowOffset = CGSize(width: 5, height: 5)
    colorOne!.layer.shadowRadius = 5
    colorOne!.layer.shadowOpacity = 0.2
    colorOne!.layer.cornerRadius = 5
    colorOne!.layer.masksToBounds = false
    
    colorTwo!.layer.shadowColor = UIColor.black.cgColor
    colorTwo!.layer.shadowOffset = CGSize(width: 5, height: 5)
    colorTwo!.layer.shadowRadius = 5
    colorTwo!.layer.shadowOpacity = 0.2
    colorTwo!.layer.cornerRadius = 5
    colorTwo!.layer.masksToBounds = false
    
    colorThree!.layer.shadowColor = UIColor.black.cgColor
    colorThree!.layer.shadowOffset = CGSize(width: 5, height: 5)
    colorThree!.layer.shadowRadius = 5
    colorThree!.layer.shadowOpacity = 0.2
    colorThree!.layer.cornerRadius = 5
    colorThree!.layer.masksToBounds = false
}
