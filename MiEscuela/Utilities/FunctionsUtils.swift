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
