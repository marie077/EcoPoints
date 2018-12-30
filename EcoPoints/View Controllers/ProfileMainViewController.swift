//
//  ProfileMainViewController.swift
//  EcoPoints
//
//  Created by Marie Ow on 12/27/18.
//  Copyright © 2018 Marie Ow. All rights reserved.
//

import UIKit
import SideMenu
import UICircularProgressRing

class ProfileMainViewController: UIViewController {
    
    @IBOutlet weak var progressRing: UICircularProgressRing!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        
        progressRing.maxValue = 100
        progressRing.innerRingColor = UIColor.blue
        // etc ...
        
      
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Somewhere not in viewDidLoad (since the views have not set yet, thus cannot be animated)
        // Remember to use unowned or weak self if refrencing self to avoid retain cycle
        progressRing.startProgress(to: 100, duration: 2.0) {
            print("Done animating!")
            // Do anything your heart desires...
        }
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
