//
//  SignInVC.swift
//  socialApp
//
//  Created by Saul Rivera on 8/6/17.
//  Copyright © 2017 Dymtech. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("YES: Unable to authenticate with Facebook- \(error!)")
            } else if result?.isCancelled == true {
                print("Yes: User canceled Facebook authentication")
            } else {
                print("YES!!!")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("YES: Unable to authenticate with Facebook- \(error!)")
            } else {
                print("Yes: Facebook authentication")
            }
        }
    }

}

