//
//  Alert.swift
//  LoginViewCode
//
//  Created by Lillian Peixoto on 27/04/22.
//

import Foundation
import UIKit

class Alert: NSObject {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert (title: String, message: String, completion: (()-> Void?)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert) //caixa alert
        let cancel = UIAlertAction(title: "OK", style: .cancel) { action in //botão cancelar
            completion?()
        }
        alertController.addAction(cancel)
        self.controller.present(alertController, animated: true, completion: nil)
    }
    
}
