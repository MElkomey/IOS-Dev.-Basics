//
//  ViewController.swift
//  Map Kit
//
//  Created by Mohamed Elkomey on 24/06/2023.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapKitView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initLocation = CLLocation(latitude: 24.688223, longitude: 46.664265)
        setInitialLocation(location: initLocation, distance: 1000)
        addAnnotation()
        
    }

    func setInitialLocation(location : CLLocation ,distance : CLLocationDistance){
       
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        mapKitView.setRegion(region, animated: true)
        // rules over map zoom cant go right ,left ,up down but zoom still working
        mapKitView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        //give zoom range
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 30000)
        mapKitView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    func addAnnotation(){
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 24.688223, longitude: 46.664265)
        pin.title = "Pin Title"
        pin.subtitle = "Pin SubTitle"
        mapKitView.addAnnotation(pin)
    }

}

