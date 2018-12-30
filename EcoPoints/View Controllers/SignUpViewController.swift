//
//  SignUpViewController.swift
//  EcoPoints
//
//  Created by Marie Ow on 12/27/18.
//  Copyright © 2018 Marie Ow. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    var db: Firestore!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    
    @IBAction func signUpAction(_ sender: Any) {
        if password.text != passwordConfirm.text {
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
                if error == nil {
                    // Add a new document with a generated ID
                    var ref: DocumentReference? = nil
                    ref = self.db.collection("users").addDocument(data: [
                        "firstName": self.firstName.text ?? "",
                        "lastName": self.lastName.text ?? "",
                        "email": self.email.text ?? "",
                        "password": self.password.text ?? "",
                        "points": 0.0,
                        "activityHistory": [
                            "walkHistory": [],
                            "bikeHistory": [],
                        ],
                        "createdAt": FieldValue.serverTimestamp(),
                    ]) { err in
                        if let err = err {
                            print("Error adding new user document: \(err)")
                        } else {
                            print("New User Document added with ID: \(ref!.documentID)")
                        }
                    }
                    self.performSegue(withIdentifier: "signToProfile", sender: self)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
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
