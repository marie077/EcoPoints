//
//  SideMenuViewController.swift
//  EcoPoints
//
//  Created by Marie Ow on 12/28/18.
//  Copyright © 2018 Marie Ow. All rights reserved.
//

import UIKit
import FirebaseAuth

class SideMenuViewController: UITableViewController {
    
    
    @IBAction func logOutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
//        self.performSegue(withIdentifier: "unwindToWelcomeViewController", sender: self)
//        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: false, completion: nil)

//        self.view.window?.rootViewController?.dismiss(animated: true, completion: (() -> Void)? {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let initial = storyboard.instantiateInitialViewController()
//            UIApplication.shared.keyWindow?.rootViewController = initial
//        })
//        self.navigationController?.popToRootViewController(animated:true)
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

}
