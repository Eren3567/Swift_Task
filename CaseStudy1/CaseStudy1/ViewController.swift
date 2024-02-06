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
   var getname = ""
    var gettitlename = ""
    var getimage = ""
    
    let iconImageNames = ["star_3794158"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
        
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
                
                self.books = json.feed.results// Book 
                
                
                
                //Update data
                DispatchQueue.main.async {
                    //  load the TableView again
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
                } } catch {
                print("Data not processed: \(error)")
            }
        }
        
        // start request
        task.resume()
        
    
    }
    }

// create table
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let booksList = books[indexPath.row]
        cell.Label1.text = booksList.artistName
        cell.Label2.text = booksList.name
        if indexPath.row < iconImageNames.count {
            cell.iconimage1.image = UIImage(named: iconImageNames[indexPath.row])
        } else {
            // indexPath.row, iconImageNames dizisinin sınırlarının dışında olduğu için bir hata meydana geldi
            //hata mesajı yazdırıldı veya varsayılan bir resim atandı
            print("Error: Index out of range for iconImageNames array")
        }
        
        // Download image from Url and assing to cell
        getimage = booksList.artworkUrl100
        if let url2 = URL(string: getimage) {
            URLSession.shared.dataTask(with: url2) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.ImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        return cell
        
        
    }
    
    // select cell from table
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let booksList = books[indexPath.row]
        getname = booksList.name
        gettitlename = booksList.artistName
        getimage = booksList.artworkUrl100
        
        
        performSegue(withIdentifier: "vc", sender: books)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vc" {
            if let destination = segue.destination as? ViewController2 {
                // pass the data to ViewController2
                destination.name = getname
                destination.titlename = gettitlename
                destination.iconImageNames = iconImageNames
                destination.imageimage = getimage
                // create the UIImage from getimage
                
              
                    
                    
                    
                
            }
        }
        
    }
    
}
