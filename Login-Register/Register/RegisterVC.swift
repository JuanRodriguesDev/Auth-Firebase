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
    
    func alert (title:String, menssage: String){
        let alertController:UIAlertController = UIAlertController (title: title, message: menssage, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
        
    }

    @IBAction func tappedRegisterButton(_ sender: Any) {
        
        let email: String = self.emailTextField.text ?? ""
        let senha: String = self.passwordTextField.text ?? ""
        
        self.auth?.createUser(withEmail: email, password: senha, completion: { ( result, error) in
            
            if error != nil {
                self.alert(title: "Atenção", menssage: "Falha ao cadastrar")
            }else{
                self.alert(title: "Parabens", menssage: "Sucesso ao cadastrar")
               
            }
            
            
        })
        
        
    }
    
    @IBAction func tappedGoBackButton(_ sender: Any) {
        self.performSegue(withIdentifier: "LoginVC", sender: nil)
    }
    
    
    
}

