//
//  TermsViewController.swift
//  Capture
//
//  Created by Mathias Palm on 2016-07-19.
//  Copyright © 2016 capture. All rights reserved.
//

import UIKit
import Crashlytics

class TermsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }

    @IBAction func acceptButtonPressed(_ sender: AnyObject) {
        
        UserManager.sharedInstance.authenticateWithUsername(username, password: password) { (user, error) in
            if let user = user {
                self.handleSuccessfullyAuthenticatedWithUser(user)
            } else if let error = error {
                self.handleFailedAuthenticationWithError(error as NSError)
            }
        }

    }
    
    fileprivate func handleSuccessfullyAuthenticatedWithUser(_ user: User) {
        DispatchQueue.main.async(execute: {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.navigateToApplication()
            }
        })
    }
    
    fileprivate func handleFailedAuthenticationWithError(_ error: NSError) {
        DispatchQueue.main.async(execute: {
            Crashlytics.sharedInstance().recordError(error)
        })
    }


}
