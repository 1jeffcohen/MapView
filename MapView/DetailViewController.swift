//
//  DetailViewController.swift
//  MapView
//
//  Created by jeff cohen on 9/22/15.
//  Copyright (c) 2015 JBC. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var manager: CLLocationManager!
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        let latitude = NSString(string: cities[activeCity]["lat"]!).doubleValue
        
        let longitude = NSString(string: cities[activeCity]["lon"]!).doubleValue
        
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        let latDelta:CLLocationDegrees = 5.0
        
        let lonDelta:CLLocationDegrees = 5.0
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        self.map.setRegion(region, animated: true)

        self.title = cities[activeCity]["name"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

