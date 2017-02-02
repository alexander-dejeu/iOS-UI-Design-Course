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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        setup()
        hardcodeIt()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hardcodeIt(){
        layer.addSublayer(shapeLayer)
        let path = UIBezierPath()
        
//        let cx = bounds.width / 2
//        let cy = bounds.height / 2
//        let t = CGFloat(M_PI * 2) / CGFloat(nodules) * CGFloat(i)
//        let x = sin(t) * 67.2 + cx
//        let y = cy - cos(t) * 67.2
//        let c = CGPoint(x: x, y: y)
        
        
        var startAngle: CGFloat = CGFloat(180-60).degreesToRadians
        var endAngle: CGFloat = CGFloat(180+300).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:180, y:180), radius: 60, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        endAngle = CGFloat(0).degreesToRadians
        startAngle  = CGFloat(300).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:180-60, y:180+103.9), radius: 60, startAngle: startAngle , endAngle: endAngle, clockwise: false)
        
        
        startAngle = CGFloat(180).degreesToRadians
        endAngle  = CGFloat(120).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:180+60, y:180+103.9), radius: 60, startAngle: startAngle , endAngle: endAngle, clockwise: true)
        
        
        startAngle = CGFloat(120).degreesToRadians
        endAngle  = CGFloat(240).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:180+60, y:180+103.9), radius: 60, startAngle: startAngle , endAngle: endAngle, clockwise: true)
        
        
        startAngle = CGFloat(60).degreesToRadians
        endAngle  = CGFloat(60+360).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:180, y:180), radius: 60, startAngle: startAngle , endAngle: endAngle, clockwise: false)

        
        startAngle = CGFloat(240).degreesToRadians
        endAngle  = CGFloat(180).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:180+60, y:180+103.9), radius: 60, startAngle: startAngle , endAngle: endAngle, clockwise: true)

        
        // Next loop
        startAngle = CGFloat(0).degreesToRadians
        endAngle  = CGFloat(60).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:180-60, y:180+103.9), radius: 60, startAngle: startAngle , endAngle: endAngle, clockwise: false)
        
        // Next loop
        startAngle = CGFloat(360+60).degreesToRadians
        endAngle  = CGFloat(360-60).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:180-60, y:180+103.9), radius: 60, startAngle: startAngle , endAngle: endAngle, clockwise: false)
        
        
        //Add one last 0.05 of the total 6*360 * 0.05 = 108
        startAngle = CGFloat(180-60).degreesToRadians
        endAngle = CGFloat(180-60+108).degreesToRadians
        
        path.addArc(withCenter: CGPoint(x:180, y:180), radius: 60, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        
    
        
        
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 4
        shapeLayer.fillColor = UIColor.clear.cgColor

        
//        let newView = UIView(frame: CGRect(x: 50, y: 50, width: 80, height: 10))
//        self.addSubview(newView)
//        
//        newView.clipsToBounds = true
//        newView.backgroundColor = .blue
//        
//        let anim = CAKeyframeAnimation(keyPath: "position")
//        
//        // set the animations path to our bezier curve
//        anim.path = path.cgPath
//        
//        // set some more parameters for the animation
//        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
//        anim.rotationMode = kCAAnimationRotateAuto
//        anim.repeatCount = Float.infinity
//        anim.duration = 3.0
//        anim.calculationMode = "paced"
//        
//        // we add the animation to the squares 'layer' property
//        newView.layer.add(anim, forKey: "animate position along path")
        
//        
        
        let a = CABasicAnimation(keyPath: "strokeEnd")
        a.duration = 3
        a.fromValue = 0.05
        a.timingFunction = CAMediaTimingFunction(name: "linear")
        a.toValue = 1
         a.repeatCount = Float.infinity
        
        let b = CABasicAnimation(keyPath: "strokeStart")
        b.duration = 3
        b.fromValue = 0.0
        b.toValue = 0.95
        b.repeatCount = Float.infinity
        b.timingFunction = CAMediaTimingFunction(name: "linear")

        shapeLayer.add(a, forKey: "strokeEnd")
        shapeLayer.add(b, forKey: "strokeStart")
        
        
        
        
        
//        let a = CABasicAnimation(keyPath: "strokeEnd")
//        a.duration = 3
//        a.fromValue = 0
//        a.toValue = 1.0
//        a.repeatCount = Float.infinity
//        
//        shapeLayer.add(a, forKey: "strokeEnd")
//        
//        let b = CABasicAnimation(keyPath: "strokeStart")
//        b.duration = 3
//        b.fromValue = 0
//        b.toValue = 1.0
//        b.beginTime = CACurrentMediaTime() + 0.5
//        b.repeatCount = Float.infinity
//        
//        shapeLayer.add(b, forKey: "strokeStart")
        
//        let b = CABasicAnimation(keyPath: "strokeStart")
//        b.duration = 3
//        b.fromValue = 0
//        b.toValue = 0.9
//        b.repeatCount = Float.infinity
//        shapeLayer.add(b, forKey: "strokeStart")
//
//        let anim = CAKeyframeAnimation(keyPath: "position")
//        
//        anim.path = path.cgPath
//        anim.calculationMode = kCAAnimationPaced
//        anim.repeatCount = Float.infinity
//        anim.duration = 5.0
//        
//        //@IBOutlet weak var ball: UIImageView!
//        self.shapeLayer.add(anim, forKey: "animate position along path")
        
        
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
