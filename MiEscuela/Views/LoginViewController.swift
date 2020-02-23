//
//  LoginViewController.swift
//  MiEscuela
//
//  Created by Luis Gachuz Trabajo on 22/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var ad_school_id : String = getSchoolID()
    var nameSchool : String = getNameSchool()
    var ref: DocumentReference!
    var getRef: Firestore!
    var storageReference : StorageReference!
    var user = [User]()
    

    @IBOutlet weak var emailTexrFiel: UITextField!
    @IBOutlet weak var lognNavBar: UINavigationBar!
    @IBOutlet weak var passwordTextFiel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lognNavBar.topItem?.title = nameSchool
        getRef = Firestore.firestore()
        storageReference = Storage.storage().reference()
    }
    
    @IBAction func cancelloginButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginActionButton(_ sender: UIButton) {
        print("HOla")
        
        guard let userEmail = emailTexrFiel.text, userEmail != "", let userPass = passwordTextFiel.text,userPass != "" else{
            return
        }
        Auth.auth().signIn(withEmail: userEmail, password: userPass){ (user,error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            print("usuario Autenticado")
            UserDefaults.standard.set(true,forKey: "logged")
            UserDefaults.standard.set(user?.user.uid,forKey: "ad_user_id")
            
            let ref = Database.database().reference(withPath: "ad_user")
            ref.queryOrdered(byChild: "ad_rol_id").queryEqual(toValue:user?.user.uid).observeSingleEvent(of: .value, with: { snapshot in

                if !snapshot.exists() { return }

                let ad_rol_id = snapshot.childSnapshot(forPath: "ad_rol_id").value
                print(ad_rol_id!)
                
                UserDefaults.standard.set(ad_rol_id,forKey: "ad_rol_id")
                
            })
            
            
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
}
