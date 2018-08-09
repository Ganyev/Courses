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
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var courseArray: [CourseBase] = []
    var coursesid: Subcategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getCoursesList(subcategoryid: coursesid.id!, completion: setCoursesList) { (error) in
            print(error)
        }
        tableView.dataSource = self
        tableView.delegate = self
        nameLabel.text = coursesid.title
        guard let mainImagePath = coursesid.subcategory_image_url else {
            return
        }
        guard let url = URL(string: mainImagePath) else {
            return
        }
        imgView.kf.setImage(with: url)
    }
    
    func setCoursesList(courseslist: [CourseBase]) {
        courseArray = courseslist
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

}
