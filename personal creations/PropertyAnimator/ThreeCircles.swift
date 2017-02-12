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
    
    let gradLayer = CAGradientLayer()
    
    var startTime : NSDate = NSDate()
    
//    var loadingIn : UILoading
//    var isAnimating = True
    open var isAnimating: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.layer.addSublayer(gradLayer)
        
        gradLayer.frame = bounds
        let red = UIColor.red.cgColor
        let yellow = UIColor.yellow.cgColor
        gradLayer.colors = [red,yellow]
        gradLayer.startPoint = CGPoint(x: 0, y: 0)
        gradLayer.endPoint = CGPoint(x: 1, y: 1)
        
        startTime = NSDate()
        hardcodeIt(color: color)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating(){
        hardcodeIt(color: .black)
        isAnimating = true
    }
    
    func stopAnimating(){
        endAnimation()
        isAnimating = false
    }

    
    func clearAnimation(){
        self.layer.removeAllAnimations()
        self.shapeLayer.removeFromSuperlayer()
        self.gradLayer.removeFromSuperlayer()
    }
    
    func endAnimation(){
        let date = NSDate()
        
        var runningTime = date.timeIntervalSince(startTime as Date)
        
        //So we happen to know the total time is : 2.84 * 1.103
        var runTime = 2.84 * 1.103
        
        var percentage = runningTime.truncatingRemainder(dividingBy: runTime) / runTime * 100.0
        
        let radius : CGFloat = self.bounds.width / 4.0 - ((self.bounds.width / 4.0)/3)/4
        
        
        var delay : Double = 0
        var cornerPoints : [CGPoint] = [CGPoint(x:0, y:0), CGPoint(x: self.bounds.width, y: 0), CGPoint(x: self.bounds.width, y: self.bounds.height), CGPoint(x: 0, y: self.bounds.height)]
        var clockwise = true
        var exitPoint : CGPoint = CGPoint(x: 0, y: 0)
        var moveIndex : Int = -1
        
        let topTangent = CGPoint(x: self.bounds.midX, y: 0)
        let leftLeftTangent = CGPoint(x: self.bounds.minX, y: self.bounds.maxY - radius)
        let leftBottomTangent = CGPoint(x: self.bounds.minX + radius, y: self.bounds.maxY)
        let rightRightTangent = CGPoint(x: self.bounds.maxX, y: self.bounds.maxY - radius)
        let rightBottomTangent = CGPoint(x: self.bounds.maxX - radius, y: self.bounds.maxY)
        
        
        if percentage >= 0 && percentage < 6.94{
            delay = ((6.94 - percentage)/100.0) * runTime
            exitPoint = topTangent
            clockwise = true
            moveIndex = 1
        }
        else if percentage >= 6.94 && percentage < 19.44{
            delay = ((19.44 - percentage)/100.0) * runTime
            exitPoint = leftLeftTangent
            clockwise = false
            moveIndex = 3
        }
        else if percentage >= 19.44 && percentage < 23.61{
            delay = ((23.61 - percentage)/100.0) * runTime
            exitPoint = leftBottomTangent
            clockwise = false
            moveIndex = 2
        }
        else if percentage >= 23.61 && percentage < 36.11{
            delay = ((36.11 - percentage)/100.0) * runTime
            exitPoint = rightRightTangent
            clockwise = true
            moveIndex = 2
        }
        else if percentage >= 36.11 && percentage < 40.277{
            delay = ((40.277 - percentage)/100.0) * runTime
            exitPoint = rightBottomTangent
            clockwise = true
            moveIndex = 3
        }
        else if percentage >= 40.277 && percentage < 52.77{
            delay = ((52.77 - percentage)/100.0) * runTime
            exitPoint = topTangent
            clockwise = false
            moveIndex = 0
        }
        else if percentage >= 52.77 && percentage < 68.055{
            delay = ((68.055 - percentage)/100.0) * runTime
            exitPoint = rightRightTangent
            clockwise = true
            moveIndex = 2
        }
        else if percentage >= 68.055 && percentage < 72.22{
            delay = ((72.22 - percentage)/100.0) * runTime
            exitPoint = rightBottomTangent
            clockwise = true
            moveIndex = 3
        }
        else if percentage >= 72.22 && percentage < 84.722{
            delay = ((84.722 - percentage)/100.0) * runTime
            exitPoint = leftLeftTangent
            clockwise = false
            moveIndex = 3
        }
        else if percentage >= 84.722 && percentage <  88.888{
            delay = ((88.888 - percentage)/100.0) * runTime
            exitPoint = leftBottomTangent
            clockwise = false
            moveIndex = 2
        }
        else{
            delay = ((100.0 - percentage)/100.0) * runTime
            exitPoint = topTangent
            clockwise = false
            moveIndex = 0
        }
        
        let newPath = UIBezierPath()
        newPath.move(to: exitPoint)
        for i in 0..<4{
            var currentIndex = moveIndex
            if clockwise == true{
                currentIndex = (moveIndex + i) % 4
            }
            else{
                currentIndex = (moveIndex - i) % 4
                if currentIndex < 0{
                    currentIndex = 4 + currentIndex
                }

            }
            newPath.addLine(to: cornerPoints[currentIndex])
        }
        newPath.addLine(to: exitPoint)
//        newPath.close()
        let timeForLength = runTime * 0.103
        delay -= timeForLength
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.a.duration =  2.84 / 4.0
            self.a.fromValue = 0.103
            self.a.toValue = 1
            self.a.repeatCount = 0
            
            
            self.b.duration = 2.84 / 4.0
            self.b.fromValue = 0.0
            self.b.toValue = 1.0 - 0.103
            self.b.repeatCount = 0
            
            self.shapeLayer.removeAllAnimations()
            self.shapeLayer.frame.origin = CGPoint(x: 0, y: 0)
            self.shapeLayer.add(self.a, forKey: "strokeEnd")
            self.shapeLayer.path = newPath.cgPath
            
            DispatchQueue.main.asyncAfter(deadline: .now() + (2.84 / 4.0)) {
                self.clearAnimation()
            }
            
        }
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
        
        gradLayer.mask = shapeLayer
        
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
