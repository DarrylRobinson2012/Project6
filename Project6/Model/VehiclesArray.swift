//
//  VehiclesArray.swift
//  Project6
//
//  Created by Darryl Robinson  on 11/12/18.
//  Copyright © 2018 ATLcoders. All rights reserved.
//

import Foundation

struct VehicleArray: Codable{    
    var count : Int
    var next: String
    var previous: String?
    var results: [Vehicles]
    
}
