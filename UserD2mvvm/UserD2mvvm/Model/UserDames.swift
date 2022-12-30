//
//  UserDames.swift
//  UserD2mvvm
//
//  Created by Dameion on 12/30/22.
//

import Foundation



struct UserDames : Codable {
    
    let username : String
    let company : Company
    
}

struct Company : Codable {
    
    let name : String
    let catchPhrase :  String
    let bs : String
}
