//
//  ViewController.swift
//  CaseStudy1
//
//  Created by Eren Çetintaş on 2.02.2024.
//

import UIKit
import Firebase
import FirebaseFirestore
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var books = [Result]()
    @IBOutlet weak var Search: UISearchBar!
    var getname = ""
    var gettitlename = ""
    var getimage = ""
    
    let iconImageNames = ["star_3794158"]
  
        var filteredBooks = [Result]()
        var isSearching = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
            Search.delegate = self
            
            let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/books/top-free/100/books.json")!
            
            // Create URLSession
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Error Control
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                // Data control
                guard let data = data else {
                    print("data exist")
                    return
                }
                
                // Processing data ( we assume it is json data)
                do {
                    let json = try JSONDecoder().decode(Alldata.self, from: data)
                    
                    self.books = json.feed.results
                    
                    // Update data
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                    let database = Firestore.firestore()
                    let booksRef = database.collection("books")

                    for book in self.books {
                        booksRef.addDocument(data: [
                            "artistName": book.artistName,
                            "name": book.name,
                            "artworkUrl100": book.artworkUrl100
                        ]) { err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                print("Document added successfully")
                            }
                        }
                    }
                } catch {
                    print("Data not processed: \(error)")
                }
            }
            
            // Start request
            task.resume()
        }
  
    
    
    @IBAction func Favorite(_ sender: Any) {
        
        performSegue(withIdentifier: "vcFovarite", sender: nil)
    }
    
}

    // MARK: - TableView Delegate & DataSource

    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return isSearching ? filteredBooks.count : books.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! 
            
            TableViewCell
            
            let book = isSearching ? filteredBooks[indexPath.row] : books[indexPath.row]
           // let booksList = books[indexPath.row]
            
            let favoriteButton = UIButton(type: .custom)
                let iconImage = UIImage(systemName: "star")
                favoriteButton.setImage(iconImage, for: .normal)
                favoriteButton.tintColor = .systemYellow // İsteğe bağlı: Buton rengini ayarlayabilirsiniz
                favoriteButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30) // Buton boyutunu ayarlayabilirsiniz
                favoriteButton.addTarget(self, action: #selector(addToFavoritesButtonTapped(_:)), for: .touchUpInside)
                favoriteButton.tag = indexPath.row // Butona hangi öğenin tıklandığını belirlemek için indeks sırasını saklayın
                cell.accessoryView = favoriteButton // Hücrenin aksesuar görünümü olarak favori butonunu ayarlayın
            cell.Label1.text = book.artistName
            cell.Label2.text = book.name
            
            if let url = URL(string: book.artworkUrl100) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data {
                        DispatchQueue.main.async {
                            cell.ImageView.image = UIImage(data: data)
                        }
                    }
                }.resume()
            }
            
            return cell
        }
        
        @objc func addToFavoritesButtonTapped(_ sender: UIButton) {
            // Hangi öğenin favori butonuna tıklandığını alın
            let index = sender.tag
            let book = isSearching ? filteredBooks[index] : books[index]
            
            // Favori butonunun icon durumunu kontrol edin
            if sender.currentImage == UIImage(systemName: "star.fill") {
                // Eğer butonun iconu star.fill ise, bu öğe favorilere eklenmiş demektir
                // Bu durumda, öğeyi favorilerden kaldırın
                removeFromFavorites(book: book)
                
                // Favori butonunun iconunu star olarak değiştirin
                sender.setImage(UIImage(systemName: "star"), for: .normal)
            } else {
                // Eğer butonun iconu star değilse, bu öğe favorilere eklenmemiş demektir
                // Bu durumda, öğeyi favorilere ekleyin
                addToFavorites(book: book)
                
                // Favori butonunun iconunu star.fill olarak değiştirin
                sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
            }
        }
        
        func removeFromFavorites(book: Result) {
            let db = Firestore.firestore()
            let favoritesCollection = db.collection("favorites")
            
            // Favori öğeyi Firestore koleksiyonunda arayın ve belge referansını alın
            favoritesCollection.whereField("name", isEqualTo: book.name).whereField("artistName", isEqualTo: book.artistName).whereField("artworkUrl100", isEqualTo: book.artworkUrl100).getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Favori kaldırılırken hata oluştu: \(error)")
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("Belge bulunamadı.")
                    return
                }
                
                // Belge bulunduysa, her bir belgeyi kaldırın
                for document in documents {
                    document.reference.delete()
                }
                
                print("Favori başarıyla kaldırıldı.")
            }
        }


        func addToFavorites(book: Result) {
            let db = Firestore.firestore()
            let favoritesCollection = db.collection("favorites")

            let favoriteData = [
                "artistName": book.artistName,
                "name": book.name,
                "artworkUrl100": book.artworkUrl100
            ]

            favoritesCollection.addDocument(data: favoriteData) { error in
                if let error = error {
                    print("Favori eklenirken hata oluştu: \(error)")
                } else {
                    print("Favori başarıyla eklendi.")
                }
            }
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let book = isSearching ? filteredBooks[indexPath.row] : books[indexPath.row]
           // getname = booksList.name
                 //   gettitlename = booksList.artistName
                 //   getimage = booksList.artworkUrl100
            performSegue(withIdentifier: "vc", sender: book)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "vc", let destination = segue.destination as? ViewController2 {
                
                //destination.name = getname
                              //  destination.titlename = gettitlename
                              
                             //   destination.imageimage = getimage
                if let book = sender as? Result {
                    destination.name = book.name
                    destination.titlename = book.artistName
                    destination.imageimage = book.artworkUrl100
                    destination.artistURL = book.artistURL ?? "yok"
                    destination.releasedate = book.releaseDate
                }
            }
        }
    }

    // MARK: - UISearchBarDelegate

    extension ViewController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            filteredBooks = books.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            isSearching = !searchText.isEmpty
            tableView.reloadData()
        }
    }
