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
                fRed -= 0.02
            }
            else
            {
                fRed += 0.02
            }
        }
        else if rnum == 1
        {
            if fGreen > 0.5
            {
                fGreen -= 0.02
            }
            else
            {
                fGreen += 0.02
            }
        }
        else
        {
            if fBlue > 0.05
            {
                fBlue -= 0.02
            }
            else
            {
                fBlue += 0.02
            }
        }
        return UIColor(red: fRed, green: fGreen, blue: fBlue, alpha: fAlpha)
    }
}
