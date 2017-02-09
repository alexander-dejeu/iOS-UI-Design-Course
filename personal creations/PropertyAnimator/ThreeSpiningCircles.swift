//
//  ThreeSpiningCircles.swift
//  PropertyAnimator
//
//  Created by Alexander Dejeu on 2/8/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ThreeSpiningCircles: UIView {

    let outerCircle = CAShapeLayer()
    let innerCircles = CAShapeLayer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        hardcodeIt(color: .brown)
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        
        
        hardcodeIt(color: color)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func squareToCircle(layer : CAShapeLayer){
        layer.cornerRadius = layer.bounds.width / 2.0
    }
    
    func hardcodeIt(color: UIColor){
        layer.addSublayer(outerCircle)
        layer.addSublayer(innerCircles)
        
        outerCircle.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        squareToCircle(layer: outerCircle)
        outerCircle.borderColor = color.cgColor
        outerCircle.borderWidth = self.frame.width / 100.0
        
        let radius : CGFloat = self.bounds.width / 4.0 - ((self.bounds.width / 4.0)/3)/4
        
        
        let DegToRadians = CGFloat(60).degreesToRadians
        let yShift = tan(DegToRadians) * radius

        
        let circleOne = CAShapeLayer()
        let circleTwo = CAShapeLayer()
        let circleThree = CAShapeLayer()
        
        circleOne.frame = CGRect(x: 0, y: 0, width: radius, height: radius)
        circleTwo.frame = CGRect(x: 0, y: 0, width: radius, height: radius)
        circleThree.frame = CGRect(x: 0, y: 0, width: radius, height: radius)
        
        squareToCircle(layer: circleOne)
        squareToCircle(layer: circleTwo)
        squareToCircle(layer: circleThree)
        
        circleOne.backgroundColor = color.cgColor
        circleTwo.backgroundColor = color.cgColor
        circleThree.backgroundColor = color.cgColor
        
        let innerW = 2.0*radius + 1.5*radius
        let innerH = 2.0*radius + (yShift)*0.75
        innerCircles.frame = CGRect(x: (outerCircle.bounds.width - innerW)/2.0, y: (outerCircle.bounds.height - innerH)/2.0, width: innerW , height: innerH)
        let cX = innerCircles.bounds.midX
        let cy = innerCircles.bounds.midY
        circleOne.position = CGPoint(x : cX, y: cy - radius*0.75)
        circleTwo.position = CGPoint(x : cX - radius*0.75, y: cy - radius*0.75 + (yShift)*0.75)
        circleThree.position = CGPoint(x : cX + radius*0.75, y: cy - radius*0.75 + (yShift)*0.75)
        
        
        innerCircles.addSublayer(circleOne)
        innerCircles.addSublayer(circleTwo)
        innerCircles.addSublayer(circleThree)
        
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = M_PI * 2
        rotationAnimation.duration = 1.5
        
        
        rotationAnimation.repeatCount = MAXFLOAT
        print(innerCircles.frame)
        
        innerCircles.add(rotationAnimation, forKey: "transform.rotation")
        
        
//        innerCircles.position = self.center
        
//        circleOne.cornerRadius = 
        
        
//        path.addArc(withCenter: CGPoint(x:2*radius, y:radius), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//        
//        endAngle = CGFloat(0).degreesToRadians
//        startAngle  = CGFloat(300).degreesToRadians
//        
//        path.addArc(withCenter: CGPoint(x:radius, y:radius+yShift), radius: radius, startAngle: startAngle , endAngle: endAngle, clockwise: false)
//        
//        
//        startAngle = CGFloat(180).degreesToRadians
//        endAngle  = CGFloat(120).degreesToRadians
//        
//        path.addArc(withCenter: CGPoint(x:3*radius, y:
    }

}
