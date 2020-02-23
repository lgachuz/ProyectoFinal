//
//  SchoolViewController.swift
//  MiEscuela
//
//  Created by Luis Alberto Gachuz Morales on 16/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import MobileCoreServices
import FirebaseStorage
import FirebaseUI

class SchoolViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var schools = [School]()
    var ref: DocumentReference!
    var getRef: Firestore!
    var storageReference: StorageReference!
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
        isLogged()
    }
    
    @IBOutlet weak var SchoolTableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getRef = Firestore.firestore()
        storageReference = Storage.storage().reference()
        SchoolTableView.delegate = self
        SchoolTableView.dataSource = self
        
        getSchools()
        

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellSchool", for: indexPath) as! SchoolsTableViewCell
        
        cell.NameSchoolLabel.text = self.schools[indexPath.row].name //"Hola Soy el Nombre"
        cell.DescriptionLabel.text = self.schools[indexPath.row].description //"Hola soy la descripcion"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(self.schools[indexPath.row].id,forKey: "IDSchool")
        //UserDefaults.standard.synchronize()
        
        UserDefaults.standard.set(self.schools[indexPath.row].name,forKey: "NameSchool")
        UserDefaults.standard.synchronize()
        
        UserDefaults.standard.set(self.schools[indexPath.row].password,forKey: "PasswordSchool")
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // se ejecuta antes de cambiar de vista
      //  if segue.identifier == "editView" {}
    }
    
    
    
    func getSchools(){
    // getRef.collection("productos").getDocuments { (querySnapshot, error) in //Es como el select de postgres
        getRef.collection("ad_school").addSnapshotListener({ (querySnapshot, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }else{
                self.schools.removeAll()
                for document in querySnapshot!.documents{
                    let id = document.documentID
                    let values = document.data() // saca los elementos del arreglo
                    let name = values["Name"] as? String ?? "Sin Valor en el nombre" // se castea con el nombre dado en Firebase
                    let description = values["Description"] as? String ?? "Sin Description" // se castea con el nombre dado en Firebase
                    let ad_client_id = values["ad_client_id"] as? String ?? "Sin ad_client_id" // se castea con el nombre dado en Firebase
                    
                    let acuerdoSep = values["AcuerdoSEP"] as? String ?? "Sin Acuerdo SEP" // se castea con el nombre dado en Firebase
                    let passwordSchool = values["password"] as? String ?? "Sin Acuerdo SEP"
                    
                    let school = School(id: id, name: name, description: description, ad_client_id: ad_client_id, acuerdoSEP: acuerdoSep,password: passwordSchool)
                    self.schools.append(school)
                    
                }
                self.SchoolTableView.reloadData()
                
            }
        })

    }
    
      func isLogged(){
            
            if UserDefaults.standard.string(forKey: "IDSchool") != nil{
                
                self.performSegue(withIdentifier: "SchoolHomeSegue", sender: nil)
            }
            else {
                print("No tuvo ID")
        }
        

    }
    
}
