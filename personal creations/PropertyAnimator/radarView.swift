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
        let labels : [String] = ["Sector A","Sector B", "Sector C", "Sector D", "Sector E", "Sector F"]
        let values : [Double] = [0.8, 2.4, 3.5, 3.2,4.6, 4.8]
        setup(labels: labels, values: values)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(labels: [String], values : [Double]){
        let verticies = getPolyPoints(sides: 6, radius: 100)
        
        
        // Make the polygon background
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
        
        // Make fill for the data!
        let max = 5.0
        let dataPoints = getFillPoints(data: values, radius: 100, max: max)
        
        self.layer.addSublayer(fillLayer)
        fillLayer.opacity = 1.0
        fillLayer.lineWidth = 2
        fillLayer.lineJoin = kCALineJoinMiter
        fillLayer.strokeColor = UIColor(hue: 0.786, saturation: 0.79, brightness: 0.53, alpha: 1.0).cgColor
        fillLayer.fillColor = UIColor(hue: 0.786, saturation: 0.15, brightness: 0.89, alpha: 1.0).cgColor
        
        let fillPath = UIBezierPath()
        for i in 0..<dataPoints.count{
            print(dataPoints[i])
            if i == 0 {
                fillPath.move(to: dataPoints[0])
            }
            else{
                fillPath.addLine(to: dataPoints[i])
            }
        }
        fillPath.close()
        fillLayer.path = fillPath.cgPath
        
        //Get the min and max?  General just set the max to be 10% away from the edges 
        //So we can just use the previous point and a percentage of max to get the radius 
        
        
        
        
        
    }
    
    func getPolyPoints(sides: Int, radius : Int) -> [CGPoint] {
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
            let x = Double(radius) * cos(2.0 * M_PI * Double(i) / Double(sides)) + Double(layer.bounds.midX)
            let y = Double(radius) * sin(2.0 * M_PI * Double(i) / Double(sides)) + Double(layer.bounds.midY)
            
            result.append(CGPoint(x: x, y: y))
        }
        return result
    }

    func getFillPoints(data : [Double], radius: Int, max : Double) -> [CGPoint] {
        var result : [CGPoint] = []
        
        for i in 0..<data.count{
            let x = (data[i] / max * Double(radius)) * cos(2.0 * M_PI * Double(i) / Double(data.count)) + Double(layer.bounds.midX)
            let y = (data[i] / max * Double(radius)) * sin(2.0 * M_PI * Double(i) / Double(data.count)) + Double(layer.bounds.midY)
            
            result.append(CGPoint(x: x, y: y))
        }
        return result

    }
    
}
