//
//  ViewController.swift
//  UseTableView
//
//  Created by Eren Çetintaş on 24.01.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var letter = [String]()

    @IBOutlet weak var Table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Table.delegate = self
        Table.dataSource = self
        
        letter = ["a","b","c","d"]
      
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return letter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.Label?.text = letter[indexPath.row]
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        print("Selected Letter : \(letter[indexPath.row])")
    }
 
    //func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    //    let delete  = UIContextualAction(style: UIContextualAction.Style.destructive, title: "DELETE"){_,_,_ in
       //     print("delete")
 //       }
  //      let edit  = UIContextualAction(style: UIContextualAction.Style.destructive, title: "EDIT"){_,_,_ in
   //         print("EDIT")
    //    }
        
      //  let swipe = UISwipeActionsConfiguration(actions: [delete,edit])
            
     //   return swipe
   // }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            letter.remove(at: indexPath.row)
            Table.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }
    }
             
             
    }
            


