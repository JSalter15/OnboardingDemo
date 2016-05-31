//
//  RegisterViewController.swift
//  OnboardingDemo
//
//  Created by Joe Salter on 5/31/16.
//  Copyright © 2016 Joe Salter. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerUser(sender: UIButton) {
        
        let email:String? = emailField.text
        let password:String? = passwordField.text
        
        let userController = UserController.sharedInstance
        
        if (email != "" && password != "") {
            let (failure_message, user) = userController.registerUser(email!, newPassword: password!)
            if (user != nil) {
                print("User registered view registration view")
            }
            else if (failure_message != nil) {
                let error = UIAlertController(title: "Error", message: failure_message, preferredStyle: UIAlertControllerStyle.Alert)
                let okButton = UIAlertAction(title: "Okay", style: .Default, handler: nil)
                error.addAction(okButton)
                
                self.presentViewController(error, animated: true, completion: nil)
            }

        }
        else {
            let emptyFieldAlert = UIAlertController(title: "Error", message: "One or more fields are empty", preferredStyle: UIAlertControllerStyle.Alert)
            let okButton = UIAlertAction(title: "Okay", style: .Default, handler: nil)
            emptyFieldAlert.addAction(okButton)
            
            self.presentViewController(emptyFieldAlert, animated: true, completion: nil)
        }
        

    }
}
