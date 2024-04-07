//
//  FavoriViewController.swift
//  CaseStudy1
//
//  Created by Eren Çetintaş on 7.04.2024.
//

import UIKit
import Firebase
class FavoriViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
       var favorites = [Result]()
       let database = Firestore.firestore()
       let favoritesCollection = Firestore.firestore().collection("favorites")
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           tableView.delegate = self
           tableView.dataSource = self
           
           // Favori öğeleri al ve tableView'ı güncelle
           fetchFavorites()
       }
       
    func fetchFavorites() {
        favoritesCollection.getDocuments { [weak self] (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching favorites: \(String(describing: error))")
                return
            }
            
            self?.favorites = documents.compactMap { document in
                let data = document.data()
                let artistName = data["artistName"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let artworkUrl100 = data["artworkUrl100"] as? String ?? ""
                return Result(artistName: artistName, id: "", name: name, releaseDate: "", kind: .books, artistID: nil, artistURL: nil, artworkUrl100: artworkUrl100, genres: [], url: "", contentAdvisoryRating: nil)
            }
            
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        
    }
    
    
   }

extension FavoriViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriCell", for: indexPath) as! TableViewCellFavorite
        let favorite = favorites[indexPath.row]
        
        cell.artistNameLabel.text = favorite.artistName
        cell.nameLabel.text = favorite.name
        
        if let url = URL(string: favorite.artworkUrl100) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.artworkImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        
        return cell
    }
}
