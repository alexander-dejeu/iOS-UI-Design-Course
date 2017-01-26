//
//  ViewController.swift
//  01 - Challenges
//
//  Created by Alexander Dejeu on 1/26/17.
//  Copyright © 2017 Do Good Technology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        challengeOne() // Red Box
//        challengeTwo() // Chessboard
        challengeThree() // Color grid
    }
    
    
    //MARK: - Challenges
    func challengeOne(){
        let frame = self.view.frame.insetBy(dx: 20, dy: 20)
        let view = UIView(frame: frame)
        view.backgroundColor = .red
        
        self.view.addSubview(view)
    }
    
    func challengeTwo(){
        let grid = Grid(frame: CGRect(x: 20, y: 20, width: 240, height: 240), rows: 10, colms: 10)
        self.view.addSubview(grid)
    }
    
    func challengeThree(){
        let view = UIView(frame: self.view.frame)
        
        let count = 10
        for i in 0 ... count {
            let layerHeight = view.bounds.height / CGFloat(count)
            let smallerLayer = CALayer()
            
            smallerLayer.frame = CGRect(x: 0, y: layerHeight * CGFloat(i), width: view.bounds.width, height: layerHeight)
            
            let hue = 1.0 / (Double)(count) * Double(i)
            smallerLayer.backgroundColor = UIColor(hue: CGFloat(hue), saturation: 1, brightness: 1, alpha: 1).cgColor
            
            
            
            view.layer.addSublayer(smallerLayer)
        }
        
        self.view.addSubview(view)
    }
    
}

