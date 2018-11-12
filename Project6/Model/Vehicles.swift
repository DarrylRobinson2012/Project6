//
//  Vehicles.swift
//  Project6
//
//  Created by Darryl Robinson  on 10/16/18.
//  Copyright © 2018 ATLcoders. All rights reserved.
//

import Foundation

struct Vehicles: Codable {
    var make: String
    var cost: String
    var length:  String
    var cLass: String
    var crew: String
    var model: String
    
    enum CodingKeys: String, CodingKey {
        case make = "manufacturer"
        case cost = "cost_in_credits"
        case length
        case cLass = "vehicle_class"
        case crew
        case model
    }
}
