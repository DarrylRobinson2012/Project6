//
//  apiclien.swift
//  Project6
//
//  Created by Darryl Robinson  on 11/6/18.
//  Copyright © 2018 ATLcoders. All rights reserved.
//

import Foundation
struct TaskManger {
    static func fetchStarshipsPage1(completion: @escaping (StarshipArray) -> Void)
    {
        print("func is called")
        NetworkManager.fetchEndpoint(URL(string: "https://swapi.co/api/starships?page=1")!) { data
            in
            let decoder = JSONDecoder()
            
            if let starships = try? decoder.decode(StarshipArray.self, from: data){
               // print(starships)
                completion(starships)
            }
        }
    }
    static func fetchPeoplePage1(completion: @escaping (PeopleArray) -> Void)
    {
        print("func is called")
        NetworkManager.fetchEndpoint(URL(string: "https://swapi.co/api/people?page=2")!) { data
            in
            let decoder = JSONDecoder()
            
            if let people = try? decoder.decode(PeopleArray.self, from: data){
                 //print(people)
               
                completion(people)
            }
        }
    }
    static func fetchVehiclesPage1(completion: @escaping (VehicleArray) -> Void)
    {
        print("func is called")
        NetworkManager.fetchEndpoint(URL(string: "https://swapi.co/api/vehicles/?page=1")!) { data
            in
            let decoder = JSONDecoder()
            
            if let vehicles = try? decoder.decode(VehicleArray.self, from: data){
                
                completion(vehicles)
            }
        }
    }
    static func fetchPLanet(plantUrl: String, completion: @escaping (Planet) -> Void)
    {
        print("func is called")
        NetworkManager.fetchEndpoint(URL(string: plantUrl)!) { data
            in
            let decoder = JSONDecoder()
            
            if let planet = try? decoder.decode(Planet.self, from: data){
              
                completion(planet)
            }
        }
    }
    
    static func fetchpeople(people: String, completion: @escaping (People) -> Void)
    {
        print("func is called")
        NetworkManager.fetchEndpoint(URL(string: people)!) { data
            in
            let decoder = JSONDecoder()
            
            if let people = try? decoder.decode(People.self, from: data){
                
                completion(people)
            }
        }
    }

}
