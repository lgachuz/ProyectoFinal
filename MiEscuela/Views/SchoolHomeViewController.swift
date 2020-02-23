//
//  SchoolHomeViewController.swift
//  MiEscuela
//
//  Created by Luis Alberto Gachuz Morales on 17/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import MobileCoreServices
import FirebaseStorage
import FirebaseUI

class SchoolHomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate  {
    
    @IBOutlet weak var NavBarHome: UINavigationBar!
    
    @IBOutlet weak var AddPostItemButton: UIBarButtonItem!
    
    var noticeSchools = [NoticeSchool]()
    var ref: DocumentReference!
    var getRef: Firestore!
    var storageReference: StorageReference!

    
    @IBOutlet weak var HomeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getRef = Firestore.firestore()
        storageReference = Storage.storage().reference()
        NavBarHome.topItem?.title = UserDefaults.standard.string(forKey: "NameSchool")
        HomeTableView.delegate = self
        HomeTableView.dataSource = self
        getNoticeAndInformation(IDSchool: UserDefaults.standard.string(forKey: "IDSchool") ?? "N/A")
        if 1 == 1 {
            //self.AddPostItemButton.isEnabled = false
            //self.AddPostItemButton.tintColor = .clear
            // hide
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeSchools.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "housecell", for: indexPath) as! HomeTableViewCell
        
        cell.TitleLabel.text = self.noticeSchools[indexPath.row].name //"Hola Soy el Nombre"
        cell.fechaLabel.text = "Fecha de Publicacion: " + self.noticeSchools[indexPath.row].fecha //"Hola Soy el Nombre"
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //self.performSegue(withIdentifier: "showhomesegue", sender: nil)
        
        if segue.identifier == "showhomesegue"{
            let indexPath = self.HomeTableView.indexPathForSelectedRow
            
            let editView = segue.destination as? ShowHomeViewController
            editView?.dataNoticeSchools = noticeSchools[(indexPath?.row)!]
        }
    }
    
     
    
    func getNoticeAndInformation(IDSchool : String)  {
        
        
        let noticeRef = getRef.collection("notice_school")
        _ = noticeRef.whereField("ad_school_id", isEqualTo: UserDefaults.standard.string(forKey: "IDSchool")!).addSnapshotListener({ (querySnapshot, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }else{
                self.noticeSchools.removeAll()
                for document in querySnapshot!.documents{
                    let id = document.documentID
                    let values = document.data() // saca los elementos del arreglo
                    let name = values["name"] as? String ?? "Sin Valor en el nombre" // se castea con el nombre dado en Firebase
                    let fecha = values["fecha"] as? String ?? "Sin ad_client_id" // se castea con el nombre dado en Firebase
                    let image_url = values["image_url"] as? String ?? "Sin ad_client_id" // se castea con el nombre dado en Firebase
                    let largetext = values["largetext"] as? String ?? "Sin ad_client_id" // se castea con el nombre dado en Firebase
                    let ad_school_id = values["ad_school_id"] as? String ?? "Sin ad_client_id" // se castea con el nombre dado en Firebase
                    let noticeSchools = NoticeSchool(id: id, name: name, fecha: fecha, image_url: image_url, largetext: largetext,ad_school_id: ad_school_id)
                    self.noticeSchools.append(noticeSchools)
                    
                }
                self.HomeTableView.reloadData()
                
            } // termina else
        })// cierra funcion
        
    } // termina funcion
    
    
    @IBAction func unwindHomesegue(_ sender: UIStoryboardSegue){
        
    }
    
}
