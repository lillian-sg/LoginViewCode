//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Lillian Peixoto on 14/04/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var auth: Auth?
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }


}
extension LoginViewController: LoginScreenProtocol{
    func actionLoginButton() {
        
        guard let login = self.loginScreen else { return }
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { (usuario, error) in
            
            if error != nil {
                print("Atenção dados incorretos, verifique e tente novamente")
            } else {
                
                if usuario == nil {
                    print("Tivemos um problema inesperado, tente mais tarde")
                } else {
                    print("Usuário logado com sucesso")
                }
                
            }
        })
        
    }
    func actionRegisterButton() {
        
        let vc: LoginViewController = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        self.loginScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }


}

