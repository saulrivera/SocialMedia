//
//  FeedVC.swift
//  socialApp
//
//  Created by Saul Rivera on 8/20/17.
//  Copyright © 2017 Dymtech. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signOutButton(_ sender: Any) {
        _ = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        try! Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
    }
    

}
