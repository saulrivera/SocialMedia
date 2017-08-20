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
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var pwdField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
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
                if let user = user {
                    self.completeSignIn(id: user.uid)
                }
                print("Yes: Facebook authentication")
            }
        }
    }

    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text , let pwd = pwdField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if let user = user {
                    self.completeSignIn(id: user.uid)
                    print("Authentication successful!")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if let user = user {
                            self.completeSignIn(id: user.uid)
                            print("Authentication done!")
                        } else {
                            print("Authentication error! - \(error!)")
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String) {
        _ = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        performSegue(withIdentifier: "goToFeed", sender: nil)
        print("SAUL: Data save to Keychain")
    }
}

