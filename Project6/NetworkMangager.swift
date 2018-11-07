//
//  NetworkMangager.swift
//  Tin Roof iOS Project
//
//  Created by Darryl Robinson  on 11/4/18.
//  Copyright © 2018 ATLcoders. All rights reserved.
//

import Foundation

struct NetworkManager {
    static func fetchEndpoint(_ endpoint: URL, completion: @escaping (Data) -> Void) {
        var request = URLRequest(url: endpoint)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                
                completion(data)
            }
        }
        task.resume()
    }
}
