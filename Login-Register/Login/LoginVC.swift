//
//  ViewController.swift
//  Login-Register
//
//  Created by Juan Rodrigues on 06/07/22.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailLoginTextField: UITextField!
    
    @IBOutlet weak var passwordLoginTextField: UITextField!
    
    var auth: Auth
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        
    }

    @IBAction func goToRegisterButton(_ sender: Any) {
        self.performSegue(withIdentifier: "RegisterVC", sender: nil)
    }
    
}

