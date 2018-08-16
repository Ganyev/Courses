//
//  MapViewController.swift
//  Courses
//
//  Created by Baha Ganyev on 16.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var mapDetails: Branch?
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var longD = (mapDetails?.longitude as! NSString).doubleValue
        var latiD = (mapDetails?.latitude as! NSString).doubleValue
        let location = CLLocationCoordinate2DMake(latiD, longD)
        let span = MKCoordinateSpanMake(0.02, 0.02)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = location
        dropPin.title = "\(mapDetails!.address!)"
        //dropPin.subtitle = "Something write here"
        mapView.addAnnotation(dropPin)
        
    }

}
