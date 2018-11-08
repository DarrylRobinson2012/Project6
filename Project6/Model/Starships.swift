//
//  Starships.swift
//  Project6
//
//  Created by Darryl Robinson  on 10/16/18.
//  Copyright © 2018 ATLcoders. All rights reserved.
//

import Foundation

struct Starships: Codable {
    var make: String
    var cost: String
    var length: String
    var cLass: String
    var crew: String
    
    
    enum CodingKeys: String, CodingKey {
        case make = "manufacturer"
        case cost = "cost_in_credits"
        case length
        case cLass = "starship_class"
        case crew
        
    }
}

