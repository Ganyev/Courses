//
//  CoursesInfoViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 09.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit


class CoursesInfoViewController: UIViewController, UITableViewDataSource, CourseTypeDelegate, UITableViewDelegate {
    
    @IBOutlet weak var infoTableView: UITableView!
    
    var contacts: [Contact] = []
    var courseDetails: CourseDetail?
    
    var course: CourseBase?
    var curentType: CourseInfoType = .info
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTableView.rowHeight = UITableViewAutomaticDimension
        infoTableView.estimatedRowHeight = 50
        infoTableView.dataSource = self
        infoTableView.delegate = self
        //убирает ненужные линии в таблице
        infoTableView.tableFooterView = UIView()
        ServerManager.shared.getCoursesDetail(courseid: course!.id!, completion: setCourseDetail) { (error) in
            print(error)
        }
    }
    //Delegate
    func changeCourseType(type: CourseInfoType) {
        self.curentType = type
        print(type)
        infoTableView.reloadData()
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
        if curentType == .info {
            return 1
        }
        if curentType == .contact {
            return courseDetails!.contacts.count
        }
        if curentType == .branche {
            return courseDetails!.branches.count
        }
        if curentType == .promo {
            return courseDetails!.actions.count
        }
        if curentType == .service {
            return courseDetails!.services.count
        }
        if curentType == .branche {
            return courseDetails!.branches.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = infoTableView.dequeueReusableCell(withIdentifier: "coursescell", for: indexPath) as! CoursesDetailUpCell
            cell.setDetails(detail: courseDetails!)
            return cell
        }
        if indexPath.section == 0 && indexPath.row == 1
        {
            let cell = infoTableView.dequeueReusableCell(withIdentifier: "fivebuttonscell", for: indexPath) as! CourseDetailDescriptionCell
            cell.delegate = self
            return cell
        }
        if curentType == .info {
            let cell = infoTableView.dequeueReusableCell(withIdentifier: "courseinfocell", for: indexPath) as! CourseInfoCell
            cell.courseInfoLabel.text = courseDetails?.description
            return cell
        }
        if curentType == .contact {
            let cell = infoTableView.dequeueReusableCell(withIdentifier: "coursecontactscell", for: indexPath) as! CourseContactsCell
            cell.setContacts(contact:courseDetails!.contacts[indexPath.row])
            return cell
        }
        if curentType == .service {
            let cell = infoTableView.dequeueReusableCell(withIdentifier: "courseservicecell", for: indexPath) as! CourseServicesCell
            cell.setServices(service: courseDetails!.services[indexPath.row])
            return cell
        }
        if curentType == .branche {
            let cell = infoTableView.dequeueReusableCell(withIdentifier: "coursebranchescell", for: indexPath) as! CourseBranchesCell
            cell.setBranches(branch: courseDetails!.branches[indexPath.row])
            return cell
        }
        if curentType == .promo {
            let cell = infoTableView.dequeueReusableCell(withIdentifier: "coursepromocell", for: indexPath) as! CourseActionsCell
            cell.setActions(action: courseDetails!.actions[indexPath.row])
            return cell
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            
        
        if curentType == .branche {
            let st = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(withIdentifier: "mapvc") as! MapViewController
            vc.mapDetails = courseDetails!.branches[indexPath.row]
            self.show(vc, sender: self)
        }
        }
    }
    
}
