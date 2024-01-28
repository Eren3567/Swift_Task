//
//  ViewController.swift
//  SearchBarandTableView
//
//  Created by Eren Çetintaş on 28.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Table: UITableView!
    @IBOutlet weak var Search: UISearchBar!
    var Letter :[String] = [String]()
    var searchLetter: [String] = [String]()
    var searchdo = false
    var selectLetter = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
Letter = ["aa","bb","cc","dd","ee"]
        Search.delegate = self
        Table.delegate = self
        Table.dataSource = self
        

    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchdo {
            return searchLetter.count
            
        }
        else {
           return Letter.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell2
        
        if searchdo {
            cell.Label2.text = searchLetter[indexPath.row]
            
        }
        else {
            cell.Label2.text = Letter[indexPath.row]
        }
        
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectLetter = Letter[indexPath.row]
        
        performSegue(withIdentifier: "Vc", sender: nil)
        
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Vc"{
            
            let destination = segue.destination as! ViewController3
            destination.labellabel = selectLetter
        }
    }
}
    extension ViewController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText == ""{
                searchdo = false
            }
            else{
                searchdo  = true
                searchLetter = Letter.filter({$0.lowercased().contains(searchText.lowercased())})
                
            }
          
            Table.reloadData()
            
        }
        
        
    }

