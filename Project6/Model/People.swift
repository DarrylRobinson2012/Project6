//
//  People.swift
//  Project6
//
//  Created by Darryl Robinson  on 10/16/18.
//  Copyright © 2018 ATLcoders. All rights reserved.
//

import Foundation

struct People: Codable {
    var born: String
    var home: String
    var height: String
    var eyes: String
    var hair: String
    var name: String
    
    enum Codingkeys: String, CodingKey {
        case name = "name"
        case born = "birth_year"
        case home = "homeworld"
        case height = "height"
        case eyes = "eye_color"
        case hair = "hair_color"
       

        
    }
}
