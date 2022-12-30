//
//  APIService.swift
//  UserD_Dame
//
//  Created by Dameion Dismuke on 12/29/22.
//

import Foundation




import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    
    func apiToGetWorkerData(completion : @escaping (Workers) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let wrkData = try! jsonDecoder.decode(Workers.self, from: data)
                    completion(wrkData)
            }
        }.resume()
    }
}
