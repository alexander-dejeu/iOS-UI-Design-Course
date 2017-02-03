//
//  radarView.swift
//  PropertyAnimator
//
//  Created by Alexander Dejeu on 2/2/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class radarView: UIView {
    
    let polyLayer = CAShapeLayer()
    let fillLayer = CAShapeLayer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        let verticies = getPoints(sides: 8, radius: 50)
        
        self.layer.addSublayer(polyLayer)
        polyLayer.opacity = 0.5
        polyLayer.lineWidth = 2
        polyLayer.lineJoin = kCALineJoinMiter
        polyLayer.strokeColor = UIColor(hue: 0.786, saturation: 0.79, brightness: 0.53, alpha: 1.0).cgColor
        polyLayer.fillColor = UIColor(hue: 0.786, saturation: 0.15, brightness: 0.89, alpha: 1.0).cgColor
        
        let polyPath = UIBezierPath()
        for i in 0..<verticies.count{
            if i == 0 {
                polyPath.move(to: verticies[0])
            }
            else{
                polyPath.addLine(to: verticies[i])
            }
        }
        polyPath.close()
        polyLayer.path = polyPath.cgPath
    }
    
    func getPoints(sides: Int, radius : Int) -> [CGPoint] {
        var result : [CGPoint] = []
        
        /*
         x[n] = r * cos(2*pi*n/N)
         y[n] = r * sin(2*pi*n/N)
         where 0 <= n < N. Note that cos and sin here are working in radians, not degrees (this is pretty common in most programming languages).
         
         If you want a different centre, then just add the coordinates of the centre point to each (x[n], y[n]). If you want a different orientation, you just need to add a constant angle. So the general form is:
         
         x[n] = r * cos(2*pi*n/N + theta) + x_centre
         y[n] = r * sin(2*pi*n/N + theta) + y_centre
 */
        for i in 0..<sides{
            let x = Double(radius) * cos(2.0 * M_PI * Double(i) / Double(sides))
            let y = Double(radius) * sin(2.0 * M_PI * Double(i) / Double(sides))
            
            result.append(CGPoint(x: x, y: y))
        }
        
        
        
        return result
    }

    
}
