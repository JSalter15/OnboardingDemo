//
//  LoggedInViewController.swift
//  OnboardingDemo
//
//  Created by Joe Salter on 5/31/16.
//  Copyright © 2016 Joe Salter. All rights reserved.
//

import UIKit

class LoggedInViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let loggedInUser = UserController.sharedInstance.logged_in_user
        
        greetingLabel.text = "Welcome, " + loggedInUser!.email + "!"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutTapped(sender: UIButton) {
        UserController.sharedInstance.logoutUser()
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.navigateToLandingViewController()
    }
    
}
