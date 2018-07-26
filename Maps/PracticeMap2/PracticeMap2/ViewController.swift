//
//  ViewController.swift
//  PracticeMap2
//
//  Created by Abhishek Patel on 2018-07-24.
//  Copyright © 2018 Abhishek Patel. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {

    //  Show the current location
    
    @IBOutlet weak var mapView: MKMapView!
    
    var manager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.manager = CLLocationManager()
        self.manager.delegate = self
        
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.manager.requestAlwaysAuthorization()
        
        self.manager.startUpdatingLocation()
       
        
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        mapView.showsUserLocation = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

