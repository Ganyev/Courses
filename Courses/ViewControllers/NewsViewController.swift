//
//  NewsViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 15.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource {

    var news: [NewsResult] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        ServerManager.shared.getNews(completion: setNews) { (error) in
            print(error)
        }
    }
    
    func setNews(newss: [NewsResult]) {
        news = newss
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newscell", for: indexPath) as! NewsCell
        cell.setDataNews(newsData: news[indexPath.row])
        return cell
    }

}
