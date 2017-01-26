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
        challengeTwo()  //Chessboard
    }
    
    
    //MARK: - Challenges
    func challengeOne(){
        let frame = self.view.frame.insetBy(dx: 20, dy: 20)
        let view = UIView(frame: frame)
        view.backgroundColor = .red
        
        self.view.addSubview(view)
    }
    
    func challengeTwo(){
        let grid = Grid(frame: CGRect(x: 20, y: 20, width: 240, height: 240), rows: 8, colms: 8)
        self.view.addSubview(grid)
    }
    
}

