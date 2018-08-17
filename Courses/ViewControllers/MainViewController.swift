//
//  MainViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 14.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var dataArray: [CourseBase] = []
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        loadCourses()
    }
    
    func loadCourses() {
    ServerManager.shared.getPaginatedListOfCourses(pageNumber: page, completion: setPaginatedData) { (error) in
            print(error)
        }
    }
    
    func setPaginatedData(data: [CourseBase]) {
        dataArray.append(contentsOf: data)
        self.tableView.reloadData()
         page = page + 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "maincell", for: indexPath) as! MainCell
        cell.setMainData(main: dataArray[indexPath.row])
        
        let lastItem = dataArray.count - 1
        if indexPath.row == lastItem {
            //print("LOAD DATA PGINATED")
            loadCourses()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "coursedetailvc") as! CoursesInfoViewController
        
        vc.course = dataArray[indexPath.row]
        self.show(vc, sender: self)
    }
    

}
