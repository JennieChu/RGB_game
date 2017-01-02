//
//  UIColor+getSimilarColor.swift
//  RGBA
//
//  Created by Jennie on 12/30/16.
//  Copyright © 2016 Jennie. All rights reserved.
//

import Foundation
import UIKit
import GameplayKit

extension UIColor
{
    /// gets a similar color to the UIColor calling this function
    ///
    /// - Returns: A UIColor with a similar color to its parent. The difference is 0.02 from either R, G or B value
    func getSimilarColor() -> UIColor
    {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha : CGFloat = 0
        var rnum = 0
        
        self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
        rnum = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        if rnum == 0
        {
            if fRed > 0.5
            {
                fRed -= 0.03
            }
            else
            {
                fRed += 0.03
            }
        }
        else if rnum == 1
        {
            if fGreen > 0.5
            {
                fGreen -= 0.03
            }
            else
            {
                fGreen += 0.03
            }
        }
        else
        {
            if fBlue > 0.05
            {
                fBlue -= 0.03
            }
            else
            {
                fBlue += 0.03
            }
        }
        // print("After change: fRed is \(fRed), fGreen is \(fGreen), fBlue is \(fBlue)")
        return UIColor(red: fRed, green: fGreen, blue: fBlue, alpha: fAlpha)
    }
}
