//
//  SubcategoriesViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 07.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class SubcategoriesViewController: UIViewController, UICollectionViewDataSource {
    
    var subCatArray: [Subcategory] = []
    var category: Category!

    @IBOutlet weak var subCatCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getSubCategories(categoryid: category.id!, completion: setSubCategories) { (error) in
            print(error)
        }
        subCatCollectionView.dataSource = self
    }
    
    func setSubCategories(subCat: [Subcategory]) {
        subCatArray = subCat
        self.subCatCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCatArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = subCatCollectionView.dequeueReusableCell(withReuseIdentifier: "subcatcell", for: indexPath) as! SubcategoriesCell
        cell.setSubcategories(subcat: subCatArray[indexPath.item])
        return cell
    }
}
