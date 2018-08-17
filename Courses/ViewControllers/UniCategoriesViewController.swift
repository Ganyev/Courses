//
//  UniCategoriesViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 17.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class UniCategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var uniCatArray: [UniCategories] = []
    var university: allUnis?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        ServerManager.shared.getUniCategories(uniId: university!.id!, completion: setUniCategories) { (error) in
            print(error)
        }
        
    }
    
//    func printUniCat(uniCategory: [UniCategories]) {
//        for i in uniCategory {
//            print(i.title)
//        }
//    }
    
    func setUniCategories(uniCategory: [UniCategories]) {
        uniCatArray = uniCategory
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return uniCatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "unibannercell") as! UniCategoriesBannerCell
            cell.setUniCategoriesBannerCell(uni: university!)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "unilcatcell") as! UniCategoriesCell
        cell.setUniCategoriesCell(uniCatCell: uniCatArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "coursedetailvc") as! CoursesInfoViewController
        vc.course = uniCatArray[indexPath.row]
        self.show(vc, sender: self)
    }

}
