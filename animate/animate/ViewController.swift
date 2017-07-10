//
//  ViewController.swift
//  animate
//
//  Created by saiusers on 16/03/17.
//  Copyright © 2017 saiusers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var circleCenter: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        circle.center = self.view.center
        circle.layer.cornerRadius = 50.0
        circle.backgroundColor = UIColor.green
          let rect = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
              rect.layer.cornerRadius = 20.0
        rect.backgroundColor = UIColor.lightGray
        self.view.addSubview(rect)
        // add pan gesture recognizer to
        circle.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.dragCircle)))
        
        self.view.addSubview(circle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func dragCircle(gesture: UIPanGestureRecognizer) {
        let target = gesture.view!
        
        switch gesture.state {
        case .began, .ended:
            circleCenter = target.center
        case .changed:
            let translation = gesture.translation(in: self.view)
            target.center = CGPoint(x: circleCenter!.x + translation.x, y: circleCenter!.y + translation.y)
        default: break
        }
    }

}

