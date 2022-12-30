//
//  Model.swift
//  DsFaults
//
//  Created by Dameion on 12/30/22.
//

import Foundation


struct BookOfLife: Codable {
    var title: String
    var authoName: String
    var dayCount: Int
}

extension UserDefaults {
    //used to storing the custom object after converting it into data
    func setObject<Object>(_ object: Object, forKey: String) where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey)
        } catch {
            print(error)
        }
    }
    
    //used to retrieve the custom object from the userdefault as Data and convert it into our own object
    func getObject<Object>(forKey: String, castTo type: Object.Type) -> Object? where Object: Decodable {
        guard let data = data(forKey: forKey) else { return nil }
        
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            print(error)
            return nil
        }
    }
}
