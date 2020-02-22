//
//  InfoViewController.swift
//  MiEscuela
//
//  Created by Luis Alberto Gachuz Morales on 20/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import MobileCoreServices
import FirebaseStorage
import FirebaseUI

class InfoViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var addInfoButton: UIBarButtonItem!
    @IBOutlet weak var InfoNavBar: UINavigationBar!
    
    @IBOutlet weak var InfoTableVIew: UITableView!
    
    var infoSchool = [InfoSchool]()
    var noticeSchools = [NoticeSchool]()
     var ref: DocumentReference!
     var getRef: Firestore!
     var storageReference: StorageReference!
    
    var ad_school_id = (UserDefaults.standard.string(forKey: "IDSchool") ?? "N/A")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InfoTableVIew.delegate = self
        InfoTableVIew.dataSource = self
        InfoNavBar.topItem?.title = UserDefaults.standard.string(forKey: "NameSchool")
        getRef = Firestore.firestore()
        getInfoSchool(ad_school_id: self.ad_school_id)
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoSchool.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoTableViewCell
        
       // cell.TitleLabel.text = "Hola Soy el Titulo y estoy bien perro grande para ver como crezxo lorem ipsum Hola Soy el Titulo y estoy bien perro grande para ver como crezxo lorem ipsum"
        
        cell.TitleLabel.text = self.infoSchool[indexPath.row].title
        cell.Contenttext.text = self.infoSchool[indexPath.row].text
        
        print(self.infoSchool[indexPath.row].text)
        
        
        
        return cell
    }
    
    func getInfoSchool(ad_school_id: String){
               
               
               let noticeRef = getRef.collection("info_school")
        
        _ = noticeRef.whereField("ad_school_id", isEqualTo: self.ad_school_id).addSnapshotListener({ (querySnapshot, error) in
                   if let error = error{
                       print(error.localizedDescription)
                       return
                   }else{
                       self.infoSchool.removeAll()
                       for document in querySnapshot!.documents{
                           let id = document.documentID
                           let values = document.data() // saca los elementos del arreglo
                           let title = values["title"] as? String ?? "Sin Valor en el Titulo" // se castea con el nombre dado en Firebase
                           let fecha = values["fecha"] as? String ?? "Sin fecha" // se castea con el nombre dado en Firebase
                           let image_url = values["image_url"] as? String ?? "Sin image_url" // se castea con el nombre dado en Firebase
                           let contentText = values["contentText"] as? String ?? "Sin contentText" // se castea con el nombre dado en Firebase
                           let ad_school_id = values["ad_school_id"] as? String ?? "Sin ad_client_id" // se castea con el nombre dado en Firebase
                           let infoSchool = InfoSchool(id: id, title: title, text: contentText, image_url: image_url, ad_school_id: ad_school_id,fecha : fecha)
                           self.infoSchool.append(infoSchool)
                        
                           
                       }
                       self.InfoTableVIew.reloadData()
                       
                   } // termina else
               })// cierra funcion
               
           } // termina funcion
}
