//
//  ViewController.swift
//  NewsProject
//
//  Created by Eren Çetintaş on 6.01.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    
   
    

    @IBOutlet weak var TableView: UITableView!
    private var newsTableViewModel : NewstableViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableView.delegate = self
        TableView.dataSource = self
        TableView.rowHeight = UITableView.automaticDimension
        TableView.estimatedRowHeight = UITableView.automaticDimension
        verial()
       
    }
    
    func verial(){
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        WebService().haberlerIndir(url: url!) { haberler in
            if let haberler = haberler {
                self.newsTableViewModel = NewstableViewModel(newsList: haberler)
                DispatchQueue.main.async{
                    self.TableView.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowsInSection()
        
        }
        
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        as! NewsCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)
        
        cell.TitleLabel.text = newsViewModel.title
        cell.StoryLabel.text = newsViewModel.story
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

