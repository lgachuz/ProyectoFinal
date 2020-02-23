//
//  SignUpViewController.swift
//  MiEscuela
//
//  Created by Luis Gachuz Trabajo on 22/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    var ad_school_id : String = getSchoolID()
    var nameSchool : String = getNameSchool()
    var userstr : User!
    var ref: DocumentReference!
    var getRef: Firestore!

    @IBOutlet weak var CURPTextField: UITextField!
    @IBOutlet weak var passwordSchoolTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signNavBar: UINavigationBar!
    @IBOutlet weak var passwordTextFiel: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         getRef = Firestore.firestore()

        
        
        signNavBar.topItem?.title = nameSchool
        
    }
    
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountButton(_ sender: UIButton) {
        guard let userEmail = emailTextField.text, userEmail != "", let userPass = passwordTextFiel.text,userPass != "", let confirmPassword = confirmPasswordTextField.text, confirmPassword != "",let passwordSchool = passwordSchoolTextField.text , passwordSchool != "" ,let curpText = CURPTextField.text , curpText != "" , userPass == confirmPassword , validatePasswordSchool(password: passwordSchool) , validateEmail(email: userEmail) else{
            
            errorMessageLabel.text = "Se encontraron errores al ingresar los datos"
             return
        }
        
        print("Fue Valido")
        
        Auth.auth().createUser(withEmail: userEmail, password: userPass){(user, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            
            //print(user?.user.email)
            
            let datos:[String: Any] = ["ad_user_id":user?.user.uid as Any,
                                       "email":userEmail,
                                       "ad_rol_id": "1"]
            
            self.ref = self.getRef.collection("ad_user").addDocument(data: datos,completion: { (error) in
                if let error = error{
                    print(error.localizedDescription)
                    
                }else{
                    print("Se guaradaron los datos")
                    //
                }
                
                
            })
            
            
            UserDefaults.standard.set(true,forKey: "logged")
            UserDefaults.standard.set(user?.user.uid,forKey: "ad_user_id")
            UserDefaults.standard.set("1",forKey: "ad_rol_id")
            
            self.dismiss(animated: true, completion: nil)
            
        }
    } // Fin cancelButton
    
}
