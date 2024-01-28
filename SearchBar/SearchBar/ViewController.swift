//
//  ViewController.swift
//  SearchBar
//
//  Created by Eren Çetintaş on 28.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SearcBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        SearcBar.delegate = self
        SearcBar.scopeButtonTitles = ["First","Second"]
        
    }


}
extension ViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("select cancel")
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        if selectedScope == 0 {
            
            print("First is selected")
            
        }
        if selectedScope == 1 {
            
            print("Second is selected")
        }
    }
}
