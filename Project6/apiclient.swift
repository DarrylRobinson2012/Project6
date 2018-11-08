//
//  apiclien.swift
//  Project6
//
//  Created by Darryl Robinson  on 11/6/18.
//  Copyright © 2018 ATLcoders. All rights reserved.
//

import Foundation
struct TaskManger {
    static func fetchStarships(completion: @escaping ([String:[Starships]]) -> Void)
    {
        print("func is called")
        NetworkManager.fetchEndpoint(URL(string: "https://swapi.co/api/starships")!) { data
            in
            let decoder = JSONDecoder()
            
            if let starships = try? decoder.decode([String:[Starships]].self, from: data){
                print(starships)
                completion(starships)
            }
            
            
            
        }
    }
}
