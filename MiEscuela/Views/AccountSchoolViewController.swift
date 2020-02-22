//
//  LoginViewController.swift
//  MiEscuela
//
//  Created by Luis Gachuz Trabajo on 22/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit

class AccountSchoolViewController: UIViewController {

    @IBOutlet weak var MessageWelcomeLabel: UILabel!
    @IBOutlet weak var LoginNavBar: UINavigationBar!
    
    var nameSchool = UserDefaults.standard.string(forKey: "NameSchool") ?? ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginNavBar.topItem?.title = self.nameSchool
        
        
        MessageWelcomeLabel.text = "Bienvenido a " + self.nameSchool + " para poder utilizar todas las funcionalidades inicie sesión su usuario o registrese"

        // Do any additional setup after loading the view.
    }
    
   

}
