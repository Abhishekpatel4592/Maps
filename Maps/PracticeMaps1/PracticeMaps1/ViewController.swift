//
//  ViewController.swift
//  PracticeMaps1
//
//  Created by Abhishek Patel on 2018-07-24.
//  Copyright © 2018 Abhishek Patel. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coord = CLLocationCoordinate2DMake(22.3072, 73.1812)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(coord, span)
        mapView.setRegion(region, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
        
        //22.3072° N, 73.1812° E
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

