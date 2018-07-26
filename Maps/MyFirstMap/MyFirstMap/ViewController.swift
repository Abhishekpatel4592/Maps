//
//  ViewController.swift
//  MyFirstMap
//
//  Created by Abhishek Patel on 2018-07-19.
//  Copyright © 2018 Abhishek Patel. All rights reserved.
//

import UIKit
import MapKit // Apple maps kit
import CoreLocation // Gives just the location of the person no relation with the map


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var mylocation : [CLLocationCoordinate2D] = []
    
    //Make a core LOcation Variable
    var manager : CLLocationManager!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //1 Set up your CoreLocation variable
        self.manager = CLLocationManager()
        self.manager.delegate = self
        
        
        //2 Tell IOS how accurate you want to be
        
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        
        //3 Ask the user for the permission to get their locaton
        manager.requestAlwaysAuthorization()
        
        //4 Get the users location
        self.manager.startUpdatingLocation()
        
        
        
        //Setup to view location on maps
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        mapView.showsUserLocation = true
        
        
       
        let b = [
            CLLocationCoordinate2DMake(43.7779, -79.3447),
            CLLocationCoordinate2DMake(44.3894, -79.6903)
            
        ]
        
        // 2. Create a MKPolyline object and tell it about your location
        
        let polyline = MKPolyline(coordinates: b, count: b.count)
        
        
        
        
        // 3. Add to the map
        self.mapView.add(polyline)
        
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        //
        
    }

    //Mark - Corelocation related Function
    
    
    //This function gets run every single time the location move
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        self.mylocation.append(mapView.userLocation.coordinate)
        
        if(self.mylocation.count > 2)
        {
            print("printing")
            let polyline = MKPolyline(coordinates: self.mylocation, count: self.mylocation.count)
            self.mapView.add(polyline)
        }
        else{
            print("Not drawing")
        }
        
        
        
        //2 UI NonSense:
        
        let coord = mapView.userLocation.coordinate
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(coord, span)
        mapView.setRegion(region, animated: true)
        
        
    }
  
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if (overlay is MKPolyline) {
            // 4.Show it on map
            
            let r = MKPolylineRenderer(overlay: overlay)
            
            //configure the line
            //how do you want the line to look?
            r.strokeColor = UIColor.blue
            r.lineWidth = 3
            
            
            return r
            
            
            
        }
        return MKOverlayRenderer()
    }
    
    

}

