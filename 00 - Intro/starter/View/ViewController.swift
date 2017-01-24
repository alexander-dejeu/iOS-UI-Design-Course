//
//  ViewController.swift
//  View
//
//  Created by Andrei Puni on 24/08/15.
//  Copyright © 2015 Andrei Puni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var largeRectView : UIView!
    @IBOutlet weak var pinkSquareView : UIView!
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**************************************
         ********* Intro Code *****************
        let frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        let blueSquare = UIView(frame: frame)
        blueSquare.backgroundColor = .blue
        
        view.addSubview(blueSquare)
        
        //Add a smaller black square in the blue square
        let smallerFrame = CGRect(x: 10, y:10, width:15, height: 15)
        let blackSquare = UIView(frame : smallerFrame)
        blackSquare.backgroundColor = .black
        
        blueSquare.addSubview(blackSquare)
        
        largeRectView.backgroundColor = .blue
        pinkSquareView.backgroundColor = .red
 */
        
        let targetFrame = CGRect(x: 100, y: 100, width: 200, height: 200)
        let targetView = UIView(frame: targetFrame)
        targetView.backgroundColor = UIColor(red: 179.0/255.0, green: 66.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        targetView.layer.cornerRadius = targetView.bounds.width / 2.0
        targetView.clipsToBounds = true
        targetView.tag = 0
        self.view.addSubview(targetView)
        
        let colors : [UIColor] = [UIColor(red: 179.0/255.0, green: 66.0/255.0, blue: 47.0/255.0, alpha: 1.0),
                                  UIColor(red: 255, green: 255, blue: 255, alpha: 1),
                                  UIColor(red: 32.0/255.0, green: 20.0/255.0, blue: 45.0/255.0, alpha: 1.0)
            ]
                                  
        for i in 0..<5{
            let newView = UIView(frame: CGRect(x: 0 + (20 * i), y: 20*i, width: 200 - (40*i), height: 200 - (40*i)))
            newView.backgroundColor = colors[i%3]
            newView.layer.cornerRadius = newView.bounds.width / 2.0
            newView.clipsToBounds = true
            targetView.addSubview(newView)
        }
        
        
        
        
        
    
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /********* Intro Code ***********
        let scale = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let rotate = CGAffineTransform(rotationAngle: CGFloat(M_PI_2 / 2))
        
        let transform = scale.concatenating(rotate)
        
        UIView.animate(withDuration: 2,
                            delay: 0,
                            options: [UIViewAnimationOptions.autoreverse, UIViewAnimationOptions.repeat],
                            animations: {
                            
                                self.pinkSquareView.transform = transform
                                self.pinkSquareView.backgroundColor = .purple
        
        }, completion: nil)
        
        UIView.animate(withDuration: 2, animations: {
            self.pinkSquareView.transform = transform
            self.pinkSquareView.backgroundColor = .purple
            
        })
        
        */
    }
}

