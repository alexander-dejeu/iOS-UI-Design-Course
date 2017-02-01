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
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
