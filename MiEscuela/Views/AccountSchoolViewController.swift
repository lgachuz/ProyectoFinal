//
//  LoginViewController.swift
//  MiEscuela
//
//  Created by Luis Gachuz Trabajo on 22/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit
import Firebase

class AccountSchoolViewController: UIViewController {

    @IBOutlet weak var MessageWelcomeLabel: UILabel!
    @IBOutlet weak var LoginNavBar: UINavigationBar!
    
    var nameSchool = UserDefaults.standard.string(forKey: "NameSchool") ?? ""
    
   override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
         isLogged()
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginNavBar.topItem?.title = self.nameSchool
        
        
        MessageWelcomeLabel.text = "Bienvenido a " + self.nameSchool + " para poder utilizar todas las funcionalidades inicie sesión con su correo o registrese"
        isLogged()
        // Do any additional setup after loading the view.
    }
    
   func isLogged(){
       Auth.auth().addStateDidChangeListener { (auth, user) in
           if user == nil{
               print("usuario no loggueado")
           }else{
               print("usuario loggueado")
              // let vc = UserInfoViewController() //change this to your class name
               // self.present(vc, animated: true, completion: nil)
               self.performSegue(withIdentifier: "acoountViewSegue", sender: self)
           }
       }
   }

}
