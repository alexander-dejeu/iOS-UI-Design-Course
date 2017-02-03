//
//  ViewController7.swift
//  PropertyAnimator
//
//  Created by Alexander Dejeu on 2/2/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController7: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let w = 50
        let r = CGRect(x: 20, y: 20, width: w, height: w)
        let v = radarView(frame: r)
        v.center = view.center
        //        v.backgroundColor = UIColor(red: 106.0/255.0, green: 229.0/255.0, blue: 222.0/255.0, alpha: 1.0)
        view.addSubview(v)

        
        // Do any additional setup after loading the view.
    }

}
