//
//  DetailStudentsViewController.swift
//  MiEscuela
//
//  Created by Luis Gachuz Trabajo on 23/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit
import Firebase

class DetailStudentsViewController: UIViewController {
    
    var ad_student_id : String = ""
    var student : Student!
    var schoolName = getNameSchool()
    var ref: DocumentReference!
    var getRef: Firestore!
    var storageReference : StorageReference!
    var nameStudent : String!
    
    
    @IBOutlet weak var detailStudentNavBar: UINavigationBar!
    @IBOutlet weak var nameStudentLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Por aqui")
        getRef = Firestore.firestore()
        
        print(self.ad_student_id + "LGM")
        get_student(ad_student_id: self.ad_student_id)
        
        detailStudentNavBar.topItem?.title = schoolName
        
        self.nameStudentLabel.text = nameStudent
    }
    
    func get_student(ad_student_id : String) {
        let ref = Database.database().reference(withPath: "ad_student")
        ref.queryOrdered(byChild: "ad_student_id").queryEqual(toValue:ad_student_id).observeSingleEvent(of: .value, with: { snapshot in
            if !snapshot.exists() {
                print("No existe")
                return }
            
            let ad_school_id = snapshot.childSnapshot(forPath: "ad_school_id").value as! String
            
            let description = snapshot.childSnapshot(forPath: "description").value as! String
            
            let name = snapshot.childSnapshot(forPath: "name").value as! String
            
            self.student = Student(ad_student_id: ad_student_id, ad_school_id: ad_school_id , description: description, name: name)
            self.nameStudentLabel.text = name
            print("Si existe")
            print(ad_student_id)
            print(name)
            
        })

    }
}
