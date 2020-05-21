//
//  AnaYerViewController.swift
//  Register-Loggin-Loggout-Test
//
//  Created by Bilgihan Köse on 17.05.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import UIKit
import Firebase

class AnaYerViewController: UIViewController {
    
    var data = [String: Any]()
 
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        
        
        db.collection("products").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.data = document.data() // DocumentID'leri cektim.
                    self.nameLabel.text = "Name: \(self.data["name"]!)"
                     self.priceLabel.text = "Price: \(self.data["price"]!)"
                }
            }
        }
     
        
        
    }
    
    @IBAction func cikisButon(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError{
            print(signOutError)
        }
    }
    
}




