//
//  NewsDetailsViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 16.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTextLabel: UITextView!
    
    //var newsDetailsArray: [NewsDetails] = []
    var news: NewsResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getNewsDetails(newsId: news!.id!, completion: setNewsDetails) { (error) in
            print(error)
        }
    }

    func setNewsDetails(news: NewsDetails) {
        //newsDetailsArray = news
        nameLabel.text = news.title
        addedLabel.text = "Добавлено: \(news.added!)"
        newsTextLabel.text = news.description
        
        guard let mainImagePath = news.news_image else {
            return
        }
        guard let url = URL(string: mainImagePath) else {
            return
        }
        newsImage.kf.setImage(with: url)
        
//        newsTextLabel = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
//
//        let lb = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
//        lb.text = news.description
//        newsTextLabel.backgroundColor = UIColor.red
//
//        // show on screen
//        self.view.addSubview(newsTextLabel)
//        newsTextLabel.addSubview(lb)
//        lb.center = newsTextLabel.center
        
    }
    
}
