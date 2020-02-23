//
//  FunctionsUtils.swift
//  MiEscuela
//
//  Created by Luis Alberto Gachuz Morales on 16/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import Foundation


func SaveUserDefaults (text: Any,forKey: String) {
    UserDefaults.standard.set(text,forKey: forKey)
    UserDefaults.standard.synchronize()
    
}


func getCurrenDateString() -> String {
    var dateString : String = ""
    var dayStr : String = ""
    var monthStr : String = ""
    
    let date = Date()
    let calendar = Calendar.current
    
    if calendar.component(.day, from: date) > 0 && calendar.component(.day, from: date) < 10 {
        //print("dentroa")
        dayStr = "0" + String(calendar.component(.day, from: date))
    }else{
       //print("fuera")
        dayStr = String(calendar.component(.day, from: date))
    }
    
    if calendar.component(.month, from: date) > 0 && calendar.component(.month, from: date) < 10 {
        //print("dentroa")
        monthStr = "0" + String(calendar.component(.month, from: date))
    }else{
       //print("fuera")
        monthStr = String(calendar.component(.month, from: date))
    }
    dateString = dayStr + "-" + monthStr + "-" + String(calendar.component(.year, from: date))
    
    return dateString
    
}

func getSchoolID() -> String {
    let ad_school_id = UserDefaults.standard.string(forKey: "IDSchool") ?? ""
    return ad_school_id
}

func getNameSchool() -> String {
    
    let nameSchool = UserDefaults.standard.string(forKey: "NameSchool") ?? ""
    return nameSchool
}

func validatePasswordSchool(password : String) -> Bool {
    let passwordShool = UserDefaults.standard.string(forKey: "PasswordSchool") ?? ""
    
    guard passwordShool == passwordShool else {
        return false
    }
    return true
}

func validateEmail(email : String) -> Bool {
    let pattern: String
    pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: email)

}

func getUserID() -> String {
    let ad_user_id = UserDefaults.standard.string(forKey: "ad_user_id") ?? ""
    return ad_user_id
}



