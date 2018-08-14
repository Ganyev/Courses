//
//  CoursesListViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 09.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import Kingfisher

class CoursesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var courseArray: [CourseBase] = []
    var subcategory: Subcategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getCoursesList(subcategoryid: subcategory.id!, completion: setCoursesList) { (error) in
            print(error)
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setCoursesList(courseslist: [CourseBase]) {
        courseArray = courseslist
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return courseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "courselogocell") as! CoursesListLogoCell
            cell.setData(subcategory: subcategory)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "coursecell") as! CoursesTVCell
        cell.setCourseList(courseList: courseArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "coursedetailvc") as! CoursesInfoViewController
        vc.course = courseArray[indexPath.row]
        self.show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        }
        return UITableViewAutomaticDimension
    }

}
