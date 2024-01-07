//
//  NewsViewModel.swift
//  NewsProject
//
//  Created by Eren Çetintaş on 6.01.2024.
//

import Foundation

struct NewstableViewModel {
    let newsList : [News]
    
}
    // extension for trying in the application
    extension NewstableViewModel{
        func numberOfRowsInSection()-> Int {
            return self.newsList.count
        }
        
        func newsAtIndexPath(_ index: Int) -> NewsViewModel{
            let news = self.newsList[index]
            return NewsViewModel(news: news)
            
        }
        
        
    }
    struct NewsViewModel{
        let news : News
        
        var title :String{
            return self.news.title
        }
            var story : String{
                return self.news.story
            }
        }
        
   

