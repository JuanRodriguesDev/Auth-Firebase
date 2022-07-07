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
    
    
    

    @IBAction func tappedLoginButton(_ sender: Any) {
        
        let email: String = self.emailLoginTextField.text ?? ""
        let senha: String = self.passwordLoginTextField.text ?? ""
        
        
        self.auth?.signIn(withEmail: email, password: senha, completion: { (usuario, error) in
           
                if error != nil{
                    self.alert(title: "Atenção", menssage: "Dados incorretos, tente novamente")
                    print("Dados incorretos, tente novamente")
            }else{
                if usuario == nil {
                    self.alert(title: "Ops", menssage: "Tivemos um erro inesperado")
                    print("Tivemos um erro inesperado")
            }else{
                    self.alert(title: "Sucesso", menssage: "Login feito com sucesso!!")
                    print("Login feito com sucesso")
              
                }
            }
        })
    }
    
    @IBAction func goToRegisterButton(_ sender: Any) {
        self.performSegue(withIdentifier: "RegisterVC", sender: nil)
        
        
       }
    
}
