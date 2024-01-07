//
//  WebService.swift
//  NewsProject
//
//  Created by Eren Çetintaş on 6.01.2024.
//

import Foundation

class WebService {
    
    
    func haberlerIndir(url: URL, completion: @escaping([News]?)->()  ){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            }else if let data = data{
                let haberledizisi = try? JSONDecoder().decode([News].self, from: data)
                if let haberledizisi = haberledizisi{
                    completion(haberledizisi)
                }
                
                }
                
        }.resume()
        }
    }

