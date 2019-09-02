//
//  NavigationController.swift
//  simple.bg
//
//  Created by Wesley Bevins on 9/1/19.
//  Copyright © 2019 Wesley Bevins. All rights reserved.
//

import UIKit

class NavigationController : UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.barTintColor = UIColor.blue
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.barTintColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
