//
//  ViewController.swift
//  EcoPoints
//
//  Created by Marie Ow on 12/26/18.
//  Copyright © 2018 Marie Ow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationItem.title = nil
        
    }
    
   
    
   
}

