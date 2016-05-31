//
//  LoginViewController.swift
//  OnboardingDemo
//
//  Created by Joe Salter on 5/31/16.
//  Copyright © 2016 Joe Salter. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginUser(sender: UIButton) {
        let email:String? = emailField.text
        let password:String? = passwordField.text
        
        let userController = UserController.sharedInstance
        
        if (email != "" && password != "") {
            let (failure_message, user) = userController.loginUser(email!, suppliedPassword: password!)
            if (user != nil) {
                print("User logged in")
                let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.navigateToLoggedInNavigationController()
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
