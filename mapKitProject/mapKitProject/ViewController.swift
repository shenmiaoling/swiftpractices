//
//  ViewController.swift
//  mapKitProject
//
//  Created by nhn on 2017/6/5.
//  Copyright © 2017年 nhn. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let location = CLLocationCoordinate2D(latitude: 23.4479120000,longitude: 116.6837200000)
        
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        mapView.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

