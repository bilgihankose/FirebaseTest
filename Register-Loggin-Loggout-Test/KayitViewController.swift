//
//  KayitViewController.swift
//  Register-Loggin-Loggout-Test
//
//  Created by Bilgihan Köse on 17.05.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import UIKit
import Firebase

class KayitViewController: UIViewController {
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var sifreTextFiel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func kayitButton(_ sender: UIButton) {
        
       if let email = mailTextField.text, let password = sifreTextFiel.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                       print(e)
                } else {
                    self.performSegue(withIdentifier: "Register", sender: self)
                }
                         }
       
        }
    }
    
    
}
