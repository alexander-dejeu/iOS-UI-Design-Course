//
//  grid.swift
//  01 - Challenges
//
//  Created by Alexander Dejeu on 1/26/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class Grid: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var currentColorIndex = 0

        for j in 0 ..< 8 {
            currentColorIndex = j % 2
            for i in 0 ..<  8{
                let x = CGFloat(i).truncatingRemainder(dividingBy: 8.0) * (self.frame.width / 8.0) + self.bounds.origin.x
                let y = CGFloat(j) * (self.frame.height / 8.0) + self.bounds.origin.y
                let frame = CGRect(x: x, y: y, width: self.frame.width / 8.0, height: self.frame.height / 8.0)
                let layer : CALayer = CALayer()
                layer.frame = frame
                
                let colors :[UIColor] = [.lightGray, .black]
                layer.backgroundColor = colors[currentColorIndex % 2].cgColor
                currentColorIndex += 1
                
                print(layer.frame)
                
                self.layer.addSublayer(layer)
            }
        }
    }
    
    init(frame : CGRect, rows: Int, colms : Int){
        super.init(frame: frame)
        var currentColorIndex = 0
        
        for j in 0 ..< rows {
            currentColorIndex = j % 2
            for i in 0 ..<  colms{
                let x = CGFloat(i).truncatingRemainder(dividingBy: CGFloat(colms)) * (self.frame.width / CGFloat(colms)) + self.bounds.origin.x
                let y = CGFloat(j) * (self.frame.height / CGFloat(rows)) + self.bounds.origin.y
                let frame = CGRect(x: x, y: y, width: self.frame.width / CGFloat(colms), height: self.frame.height / CGFloat(rows))
                let layer : CALayer = CALayer()
                layer.frame = frame
                
                let colors :[UIColor] = [.lightGray, .black]
                layer.backgroundColor = colors[currentColorIndex % 2].cgColor
                currentColorIndex += 1
                
                print(layer.frame)
                
                self.layer.addSublayer(layer)
            }
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("grid! init(coder:) has not been implemented")
    }

}
