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
        label.font = UIFont(name: "Arial Rounded MT Bold", size: view.frame.width * 0.2)
        view.addSubview(label)
        
        // hardcode to center constraint
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        gest = UISwipeGestureRecognizer(target: self, action: nil)
        gest.direction = .init(arrayLiteral: [.left, .right, .up, .down])
        gest.delegate = self
        view.addGestureRecognizer(gest)
    }
    
    func fadeLabel(_ fadeIn: Bool) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            UIView.animate(withDuration: 0.5, animations: { [unowned self] in
                self.label.alpha = fadeIn ? 1 : 0
                }, completion: { _ in
                    self.label.alpha = fadeIn ? 1 : 0
            })
        })
    }
}

extension ViewController : UIGestureRecognizerDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.label.alpha = 1
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        if let touch = touches.first {
            
            // calculate percentages of distances across screen dimensions of the touch in the view
            // to determine colors
            let location = touch.location(in: self.view)
            let widthPercentage = location.x / self.view.frame.width
            let heightPercentage = location.y / self.view.frame.height
            // determine color here so we can both assign it and extract hex values
            // for displaying
            let color = UIColor(hue: widthPercentage, saturation: heightPercentage, brightness: heightPercentage, alpha: 1)
            let hexString = String(format: "#%02X%02X%02X", UInt8(color.cgColor.components![0] * 255),
                                                           UInt8(color.cgColor.components![1] * 255),
                                                           UInt8(color.cgColor.components![2] * 255))
            
            self.label.text = hexString
            self.view.backgroundColor = color
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        print("CANCELLED")
        fadeLabel(false)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        print("ended")
        fadeLabel(false)
    }
}
