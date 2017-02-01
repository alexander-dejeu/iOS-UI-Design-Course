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
        for i in 0 ..< 3 {
            let t = CGFloat(M_PI * 2) / 3 * CGFloat(i)
            let x = sin(t) * 60 + cx
            let y = cy - cos(t) * 60
            let c = CGPoint(x: x, y: y)
            let startAngle: CGFloat = 0
            let endAngle = CGFloat(M_PI * 2) * 0.75
            
            path.addArc(withCenter: c, radius: 40, startAngle: 0, endAngle: endAngle, clockwise: true)
        }
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.clear.cgColor
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
