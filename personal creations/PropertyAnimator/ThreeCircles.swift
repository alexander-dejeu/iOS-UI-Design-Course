//
//  ThreeCircles.swift
//  PropertyAnimator
//
//  Created by mitchell hudson on 1/31/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ThreeCircles: UIView {
    
    let shapeLayer = CAShapeLayer()
    var path = UIBezierPath()
    var a = CABasicAnimation(keyPath: "strokeEnd")
    var b = CABasicAnimation(keyPath: "strokeStart")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        

        hardcodeIt(color: color)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func endAnimation(){
        print(path.currentPoint)
        print(shapeLayer.path?.currentPoint)
        print(shapeLayer.presentation()?.strokeEnd)
        print(shapeLayer.position)
        shapeLayer.removeAllAnimations()
    
        print(shapeLayer.presentation()?.position)
        
        
        
        let newPath = UIBezierPath()
        newPath.move(to: CGPoint(x: 0, y: 0))
        newPath.addLine(to: CGPoint(x: shapeLayer.bounds.width, y: 0))
        newPath.addLine(to: CGPoint(x: shapeLayer.bounds.width, y: shapeLayer.bounds.height))
        newPath.addLine(to: CGPoint(x: 0, y: shapeLayer.bounds.height))
        newPath.addLine(to: CGPoint(x: 0, y: 0))
        
        
        
        
    }
    
    func hardcodeIt(color: UIColor){
        layer.addSublayer(shapeLayer)
        
        
        let radius : CGFloat = self.bounds.width / 4.0 - ((self.bounds.width / 4.0)/3)/4

        
        let DegToRadians = CGFloat(60).degreesToRadians
        let yShift = tan(DegToRadians) * radius
        
        
        var startAngle: CGFloat = CGFloat(180-60).degreesToRadians
        var endAngle: CGFloat = CGFloat(180+300).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:2*radius, y:radius), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        endAngle = CGFloat(0).degreesToRadians
        startAngle  = CGFloat(300).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:radius, y:radius+yShift), radius: radius, startAngle: startAngle , endAngle: endAngle, clockwise: false)
        
        
        startAngle = CGFloat(180).degreesToRadians
        endAngle  = CGFloat(120).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:3*radius, y:radius+yShift), radius: radius, startAngle: startAngle , endAngle: endAngle, clockwise: true)
        
        
        startAngle = CGFloat(120).degreesToRadians
        endAngle  = CGFloat(240).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:3*radius, y:radius+yShift), radius: radius, startAngle: startAngle , endAngle: endAngle, clockwise: true)
        
        
        startAngle = CGFloat(60).degreesToRadians
        endAngle  = CGFloat(60+360).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:2*radius, y:radius), radius: radius, startAngle: startAngle , endAngle: endAngle, clockwise: false)

        
        startAngle = CGFloat(240).degreesToRadians
        endAngle  = CGFloat(180).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:3*radius, y:radius+yShift), radius: radius, startAngle: startAngle , endAngle: endAngle, clockwise: true)

        
        // Next loop
        startAngle = CGFloat(0).degreesToRadians
        endAngle  = CGFloat(60).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:radius, y:radius+yShift), radius: radius, startAngle: startAngle , endAngle: endAngle, clockwise: false)
        
        // Next loop
        startAngle = CGFloat(360+60).degreesToRadians
        endAngle  = CGFloat(360-60).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:radius, y:radius+yShift), radius: radius, startAngle: startAngle , endAngle: endAngle, clockwise: false)
        
        
        //Add one last 0.05 of the total 6*360 * 0.05 = 108
//        08333333333333
        startAngle = CGFloat(180-60).degreesToRadians
        endAngle = CGFloat(180-60+222.48).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:2*radius, y:radius), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = radius / 3
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = "round"
 
        
        
        a.duration = 2.84 * 1.103
        a.fromValue = 0.103
        a.timingFunction = CAMediaTimingFunction(name: "linear")
        a.toValue = 1
         a.repeatCount = Float.infinity
        
        
        b.duration = 2.84 * 1.103
        b.fromValue = 0.0
        b.toValue = 1.0 - 0.103
        b.repeatCount = Float.infinity
        b.timingFunction = CAMediaTimingFunction(name: "linear")

        shapeLayer.add(a, forKey: "strokeEnd")
        shapeLayer.add(b, forKey: "strokeStart")
        
        shapeLayer.frame.origin = CGPoint(x: (self.bounds.width - 4*radius)/2, y: (self.bounds.height - 2*radius - yShift)/2)
        
    }
    
    func setup() {
        layer.addSublayer(shapeLayer)
        let path = UIBezierPath()
        let cx = bounds.width / 2
        let cy = bounds.height / 2
        let nodules = 3
        for i in 0 ..< nodules {
            let t = CGFloat(M_PI * 2) / CGFloat(nodules) * CGFloat(i)
            let x = sin(t) * 67.2 + cx
            let y = cy - cos(t) * 67.2
            let c = CGPoint(x: x, y: y)
            let pi = CGFloat(M_PI * 2)
            let startAngle: CGFloat = (pi * 0.38) + (pi / CGFloat(nodules) * CGFloat(i))
            let endAngle = startAngle + pi * 0.75
            
            path.addArc(withCenter: c, radius: 60, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        }
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.clear.cgColor
    }
    
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
