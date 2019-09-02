//
//  ViewController.swift
//  simple.bg
//
//  Created by Wesley Bevins on 9/1/19.
//  Copyright © 2019 Wesley Bevins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label : UILabel!
    var gest : UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        label = UILabel(frame: .zero)
        label.text = "Display color value here!"
        label.textColor = UIColor.black
        view.addSubview(label)
        
        // hardcode to center constraint
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        gest = UISwipeGestureRecognizer(target: self, action: nil)
        gest.direction = .init(arrayLiteral: [.up, .down, .left, .right])
        gest.delegate = self
        view.addGestureRecognizer(gest)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}

extension ViewController : UIGestureRecognizerDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        print("started")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        print("moved")
        if let touch = touches.first {
            let location = touch.location(in: self.view)
            let widthPercentage = location.x / self.view.frame.width
            let heightPercentage = location.y / self.view.frame.height
            
            print(widthPercentage, heightPercentage)
            
            self.view.backgroundColor = UIColor(hue: widthPercentage, saturation: heightPercentage, brightness: heightPercentage, alpha: 1)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        print("ended")
    }
}
