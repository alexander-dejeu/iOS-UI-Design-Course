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
        hardcodeWithPath(color: .brown)
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
    
    func hardcodeWithPath(color: UIColor){
        layer.addSublayer(outerCircle)
        outerCircle.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        squareToCircle(layer: outerCircle)
        outerCircle.borderColor = color.cgColor
        outerCircle.borderWidth = self.frame.width / 50.0
        
        var path = UIBezierPath()
//        
//        path.addArc(withCenter: CGPoint(x: outerCircle.frame.midX, y:outerCircle.frame.midY), radius: 3*radius, startAngle: 0, endAngle: 360, clockwise: true)
//        
//        
//        shapeLayer.path = path.cgPath
//        shapeLayer.strokeColor = color.cgColor
//        shapeLayer.lineWidth = radius / 3
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.lineCap = "round"
//        
//        
//        
//        a.duration = 2.84 * 1.103
//        a.fromValue = 0.103
//        a.timingFunction = CAMediaTimingFunction(name: "linear")
//        a.toValue = 1
//        a.repeatCount = Float.infinity

    }
    
    func hardcodeIt(color: UIColor){
        layer.addSublayer(outerCircle)
        layer.addSublayer(innerCircles)
        
        outerCircle.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        squareToCircle(layer: outerCircle)
        outerCircle.borderColor = color.cgColor
        outerCircle.borderWidth = self.frame.width / 50.0
        
        let radius : CGFloat = self.bounds.width / 5.0 - ((self.bounds.width / 5.0)/3)/5
        
        
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
//        let innerH = 2.0*radius + (yShift)*0.75
        innerCircles.frame = CGRect(x: (outerCircle.bounds.width - innerW)/2.0, y: (outerCircle.bounds.height - innerW)/2.0, width: innerW , height: innerW)
        let cX = innerCircles.bounds.midX
        let cy = innerCircles.bounds.midY
        circleOne.position = CGPoint(x : cX, y: cy - radius*0.75)
        circleTwo.position = CGPoint(x : cX - radius*0.75, y: cy - radius*0.75 + (yShift)*0.75)
        circleThree.position = CGPoint(x : cX + radius*0.75, y: cy - radius*0.75 + (yShift)*0.75)
        print(innerCircles.frame)
        
        innerCircles.addSublayer(circleOne)
        innerCircles.addSublayer(circleTwo)
        innerCircles.addSublayer(circleThree)
        
        print(circleOne.frame)
        print(circleTwo.frame)
        print(circleThree.frame)
        
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = M_PI * 2
        rotationAnimation.duration = 1.25
        
        
        rotationAnimation.repeatCount = MAXFLOAT
        print(innerCircles.frame)
        
        innerCircles.add(rotationAnimation, forKey: "transform.rotation")
    }

}
