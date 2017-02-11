//
//  ViewController6.swift
//  PropertyAnimator
//
//  Created by mitchell hudson on 1/31/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController6: UIViewController {

    @IBOutlet weak var endAnimationButton: UIButton!
    var v = ThreeCircles()
    var v3 = ThreeSpiningCircles()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let w = 50
        let r = CGRect(x: 20, y: 20, width: w, height: w)
        let lightBlue = UIColor(red: 106.0/255.0, green: 229.0/255.0, blue: 222.0/255.0, alpha: 1.0)
        v = ThreeCircles(frame: r, color: lightBlue)
        
        v3 = ThreeSpiningCircles(frame: r)
        
        v.backgroundColor = .black
        
        v.center = view.center
        view.addSubview(v)
    }
    
    @IBAction func endAnimation(sender: UIButton){
        v.endAnimation()
    }
}
