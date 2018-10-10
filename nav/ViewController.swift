//
//  ViewController.swift
//  nav
//
//  Created by Sebastian Hette on 31.01.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    
    @IBAction func showMeWhere(_ sender: Any)
    {
        
        openMapForPlace()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let pLat = 19.100674299999994
//        let pLong = 72.8907349
//        let center = CLLocationCoordinate2D(latitude: pLat, longitude: pLong)
//
//        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//
//
//        self.map.setRegion(region, animated: true)
        
        focusMapView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func openMapForPlace() {
        
        let latitude: CLLocationDegrees = 19.100674299999994
        let longitude: CLLocationDegrees = 72.8907349
        let regionDistance: CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Test"
        
        MKMapItem.openMaps(with: [mapItem], launchOptions: options)
    }
    
    func focusMapView() {
        map.mapType = MKMapType.standard
        
        let latitude: CLLocationDegrees = 19.100674299999994
        let longitude: CLLocationDegrees = 72.8907349
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location

        map.addAnnotation(annotation)
    }
}

