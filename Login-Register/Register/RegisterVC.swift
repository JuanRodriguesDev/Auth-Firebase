//
//  ViewController.swift
//  Login-Register
//
//  Created by Juan Rodrigues on 06/07/22.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        
    }

    @IBAction func tappedRegisterButton(_ sender: Any) {
        
        let email: String = self.emailTextField.text ?? ""
        let senha: String = self.passwordTextField.text ?? ""
        
        self.auth?.createUser(withEmail: email, password: senha, completion: { ( result, error) in
            
            if error != nil {
                print("Falha ao cadastrar")
            }else{
                print("Sucesso ao cadastrar")
            }
            
            
        })
        
        
    }
    
    @IBAction func tappedGoBackButton(_ sender: Any) {
        self.performSegue(withIdentifier: "LoginVC", sender: nil)
    }
    
    
    
}

