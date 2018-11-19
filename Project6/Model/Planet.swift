//
//  Planet.swift
//  Project6
//
//  Created by Darryl Robinson  on 11/15/18.
//  Copyright © 2018 ATLcoders. All rights reserved.
//

import Foundation

struct  Planet: Codable {
    var name: String
    
    
}

enum CodingKeys: CodingKey {
    case name
}
