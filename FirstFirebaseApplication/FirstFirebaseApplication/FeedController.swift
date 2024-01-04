//
//  FeedController.swift
//  FirstFirebaseApplication
//
//  Created by Eren Çetintaş on 31.12.2023.
//

import UIKit

class FeedController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var Tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Tableview.delegate = self
        Tableview.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.emailtext2.text = "eren@gmail.com"
        cell.KullanıcıYorumuText.text = "yorumum"
        cell.imageview.image = UIImage(named: "gorselsec")
        return cell
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
