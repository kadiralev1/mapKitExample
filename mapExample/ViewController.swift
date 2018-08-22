//
//  ViewController.swift
//  mapExample
//
//  Created by Kadir Kutluhan Alev on 22.08.2018.
//  Copyright © 2018 Kadir Kutluhan Alev. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController , MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitute : CLLocationDegrees = 37.4134391
        let longitude : CLLocationDegrees = -122.1513075
        
        let latDelta : CLLocationDegrees = 0.05 // harıtayı gösterme zoom seviyesi
        let lonDelta : CLLocationDegrees = 0.05
        
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitute, longitude: longitude)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation  = MKPointAnnotation()
        annotation.title = "Silicon Valley"
        annotation.subtitle = "One day ı'll go here..."
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
    }
    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        
         let touchPoint = gestureRecognizer.location(in: self.map) // map da tıkladıgı yeri aldık
        
        let coordinate = map.convert(touchPoint,toCoordinateFrom: self.map) // daha sonra tıkladıgı yerın kordinatını aldık map den
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New Place"
        map.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

