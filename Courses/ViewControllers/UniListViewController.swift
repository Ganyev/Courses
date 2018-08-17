//
//  UniListViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 15.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class UniListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var unisArray: [allUnis] = []
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        ServerManager.shared.getUnis(completion: setAllUnis) { (error) in
            print(error)
        }
    }
    
    func setAllUnis(uni: [allUnis]) {
        unisArray = uni
        self.collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return unisArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 199, height: 150)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "unicell", for: indexPath) as! UniListCell
        cell.setDataUni(uni: unisArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "unicatvc") as! UniCategoriesViewController
        vc.university = unisArray[indexPath.row]
        self.show(vc, sender: self)
    }
    

}
