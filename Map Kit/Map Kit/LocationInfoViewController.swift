//
//  LocationInfoViewController.swift
//  Map Kit
//
//  Created by Mohamed Elkomey on 25/06/2023.
//

import UIKit
import MapKit

class LocationInfoViewController: UIViewController , MKMapViewDelegate{

    var prevLocation : CLLocation? = nil
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        
    }

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let newLocation = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        if prevLocation == nil || prevLocation!.distance(from: newLocation) > 10 {
            getLocationInfo(location: newLocation)
        }
        
    }

    func getLocationInfo(location : CLLocation){
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) {( places, error) in
            guard let place = places?.first , error == nil else{
                return
            }
            print(place.name ?? "")
            print(place.country ?? "")
            print(place.administrativeArea ?? "")
        }
    }
    
}
