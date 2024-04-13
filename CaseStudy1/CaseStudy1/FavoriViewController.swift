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
    
    var favorites = [ResultWithID]() // Favori öğeleri için belge kimliği ve verileri tutacak bir dizi
    
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
                guard let id = document.documentID as? String, // Belge kimliğini nil olmadığını kontrol ederek al
                      let artistName = data["artistName"] as? String,
                      let name = data["name"] as? String,
                      let artworkUrl100 = data["artworkUrl100"] as? String else {
                    return nil
                }
                return ResultWithID(id: id, artistName: artistName, name: name, artworkUrl100: artworkUrl100)
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
                DispatchQueue.global().async {
                    let data  = try? Data(contentsOf: url)
                    if let data = data {
                        DispatchQueue.main.async {
                            cell.artworkImageView.image = UIImage(data: data)
                        }
                    }
                }
            }.resume()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Silme eylemi oluştur
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_, _, completionHandler) in
            self?.deleteFavorite(at: indexPath)
            completionHandler(true) // İşlem tamamlandığında bildir
        }
        deleteAction.backgroundColor = .red // Silme eyleminin arka plan rengini belirle
        
        // Oluşturulan eylemleri bir diziye ekle
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
    
    func deleteFavorite(at indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        
        guard !favorite.id.isEmpty else {
            print("Error: Document ID is empty")
            return
        }
        
        // Firestore'dan belgeyi sil
        favoritesCollection.document(favorite.id).delete { [weak self] error in
            if let error = error {
                print("Error deleting favorite: \(error.localizedDescription)")
                return
            }
            
            // Tablodan öğeyi sil
            self?.favorites.remove(at: indexPath.row)
            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

struct ResultWithID {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
}
