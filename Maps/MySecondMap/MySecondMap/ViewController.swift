//
//  ViewController.swift
//  MySecondMap
//
//  Created by Abhishek Patel on 2018-07-19.
//  Copyright © 2018 Abhishek Patel. All rights reserved.
//

import UIKit
import MapKit


// -----------------------------------------
// THIS APP DRAWS A SIMPLE POLYLINE!!!!!
// -----------------------------------------

// Draw line between the two points it doesn't move


class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.mapView.delegate = self
        
        
        
        let coord = CLLocationCoordinate2DMake(43.7779, -79.3447)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(coord, span)
        mapView.setRegion(region, animated: true)
        
        // Polyline
        
        
        // 1. Create an array on Locations
        
        let b = [
            CLLocationCoordinate2DMake(43.7779, -79.3447),
            CLLocationCoordinate2DMake(44.3894, -79.6903)
        
        ]
        
        // 2. Create a MKPolyline object and tell it about your location
        
        let polyline = MKPolyline(coordinates: b, count: b.count)
        
        
        
        
        // 3. Add to the map
        self.mapView.add(polyline)
        
        
        
        
        
       
    }
    
    
    // Making graphics on maps
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if (overlay is MKPolyline) {
            // 4.Show it on map
            
            let r = MKPolylineRenderer(overlay: overlay)
            
            //configure the line
            //how do you want the line to look?
            r.strokeColor = UIColor.red
            r.lineWidth = 4
            
            
            return r
            
            
            
        }
        return MKOverlayRenderer()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

