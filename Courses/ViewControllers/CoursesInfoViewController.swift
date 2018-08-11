//
//  CoursesInfoViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 09.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class CoursesInfoViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var infoTableView: UITableView!
    
    var courseDetails: CourseDetail?
    var course: CourseBase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTableView.dataSource = self
        ServerManager.shared.getCoursesDetail(courseid: course!.id!, completion: setCourseDetail) { (error) in
            print(error)
        }
    }
    
    func setCourseDetail(detail: CourseDetail) {
        courseDetails = detail
        self.infoTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _ = courseDetails else {
            return 0
        }
        if section == 0  {
            return 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = infoTableView.dequeueReusableCell(withIdentifier: "coursescell", for: indexPath) as! CoursesDetailUpCell
            cell.setDetails(detail: courseDetails!)
            return cell
        } else if indexPath.section == 0 && indexPath.row == 1 {
            let cell = infoTableView.dequeueReusableCell(withIdentifier: "fivebuttonscell", for: indexPath) as! CourseDetailDescriptionCell
            return cell
        }
        return UITableViewCell()
        
    }
    

}
