//
//  Webservice.swift
//  GetDataInternet
//
//  Created by Eren Çetintaş on 29.01.2024.
//

import Foundation

class Webservice {
    
    func downloadNews (url : URL, completion : @escaping ([News]?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { (data,response, error) in
            if let Error = error {
                
                print(Error.localizedDescription)
                completion(nil)
            }
            
            
            else if let data = data {
                
                let NewsArray = try?  JSONDecoder().decode([News].self, from: data)
            
                if let NewsArray = NewsArray {
                    completion(NewsArray)
                }
                    
                }
                
            }
        }
        
        
    }

