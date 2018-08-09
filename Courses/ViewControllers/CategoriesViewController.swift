//
//  CategoriesViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 07.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    var catArray: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        ServerManager.shared.getCategories(completion: setCategories) { (error) in
            print(error)
        }
    }
    
    func setCategories(category: [Category]) {
        catArray = category
        self.categoriesCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoriescell", for: indexPath) as! CategoriesCell
        cell.setCategories(category: catArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 191, height: 191)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "subcatvc") as! SubcategoriesViewController
        vc.category = catArray[indexPath.item]
        self.show(vc, sender: self)
    }

}
