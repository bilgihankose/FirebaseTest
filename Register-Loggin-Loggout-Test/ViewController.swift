//
//  ViewController.swift
//  Register-Loggin-Loggout-Test
//
//  Created by Bilgihan Köse on 17.05.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var spinner = UIActivityIndicatorView()
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func girisButton(_ sender: UIButton) {
        
        spinner = UIActivityIndicatorView(frame: CGRect(x:0, y:0, width: 50, height: 50))// bundan sonrasi artik spinner nerede duracaksa
        spinner.center = view.center
        spinner.hidesWhenStopped = true
        spinner.style = UIActivityIndicatorView.Style.large
        view.addSubview(spinner)
        spinner.startAnimating()// buraya kadar ekle
        
        if let email = mailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                // ...
                if let e = error {
                    
                    let alert = UIAlertController(title: "Hatali Giris", message: "\(e.localizedDescription)", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                    
                } else {
                    self.spinner.stopAnimating() // bu da spinner nerede duracaksa oraya eklenecek
                    self.performSegue(withIdentifier: "Register", sender: self)
                }
            }
            
        }
    }
}

