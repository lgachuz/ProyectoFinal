//
//  StudentsViewController.swift
//  MiEscuela
//
//  Created by Luis Gachuz Trabajo on 23/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import MobileCoreServices
import FirebaseStorage
import FirebaseUI

class StudentsbyUserViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
    
    
    var ref: DocumentReference!
    var getRef: Firestore!
    var storageReference: StorageReference!
    var userStudents = [UserStudent]()
    
    var studentname : String = ""
    var groupname : String = ""
    var ad_school_id = getSchoolID()
    var ad_user_id = getUserID()
    
    
    @IBOutlet weak var studenUserTableView: UITableView!
    @IBOutlet weak var studenUserNavBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        studenUserTableView.delegate = self
        studenUserTableView.dataSource = self
        getRef = Firestore.firestore()
       // print(self.ad_user_id + " ---  "  +  self.ad_school_id)
        getUserStudents(ad_user_id: self.ad_user_id, ad_school_id: self.ad_school_id)
        
        

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print(userStudents.count)
        return userStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellStudentUser", for: indexPath) as! UserStudentsTableViewCell
        
        cell.StudentNamaLabel.text = self.userStudents[indexPath.row].username
        
        // self.infoSchool[indexPath.row].title
        cell.gradoGrupoLabel.text = self.userStudents[indexPath.row].groupname
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //self.performSegue(withIdentifier: "showhomesegue", sender: nil)
        
        if segue.identifier == "showInfoDetailSegue"{
            let indexPath = self.studenUserTableView.indexPathForSelectedRow
            
            let editView = segue.destination as? DetailStudentsViewController
            print(self.userStudents[(indexPath?.row)!].ad_student_id)
            editView?.ad_student_id = self.userStudents[(indexPath?.row)!].ad_student_id
            
            editView?.nameStudent = self.userStudents[(indexPath?.row)!].username
            
        }
    }
    
    func getUserStudents(ad_user_id : String, ad_school_id : String) {
        let userStudentRef = getRef.collection("ad_user_students")
        
        userStudentRef.whereField("ad_school_id", isEqualTo: ad_school_id).whereField("ad_user_id", isEqualTo:ad_user_id).addSnapshotListener({ (querySnapshot, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }else{
                self.userStudents.removeAll()
                for document in querySnapshot!.documents{
                    
                    let values = document.data() // saca los elementos del arreglo
                    let ad_school_id = values["ad_school_id"] as? String ?? "Sin Valor en ad_school_id" // se castea con el nombre dado en Firebase
                    let ad_student_id = values["ad_student_id"] as? String ?? "Sin ad_student_id" // se castea con el nombre dado en Firebase
                    let ad_user_id = values["ad_user_id"] as? String ?? "Sin ad_user_id" // se castea con el nombre dado en Firebase
                    let ad_group_id = values["ad_group_id"] as? String ?? "Sin ad_group_id" // se castea con el nombre dado en Firebase
                    let username = values["studentName"] as? String ?? "Sin ad_group_id"
                    let groupname = values["groupName"] as? String ?? "Sin ad_group_id"
                    
                    
                    let userStudents = UserStudent(ad_school_id: ad_school_id, ad_student_id: ad_student_id, ad_user_id: ad_user_id, username: username, ad_group_id: ad_group_id, groupname: groupname)
                    self.userStudents.append(userStudents)
                 
                    
                }
                self.studenUserTableView.reloadData()
                
            } // termina else
        })// cierra funcion
        
    }
    
}
