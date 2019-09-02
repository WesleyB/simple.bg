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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        label = UILabel(frame: .zero)
        label.text = "Hello, world!"
        label.textColor = UIColor.black
        view.addSubview(label)
        
        // hardcode to center constraint
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    
}

