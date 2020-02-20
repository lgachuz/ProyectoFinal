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
