//
//  CustomMapViewController.swift
//  Map Kit
//
//  Created by Mohamed Elkomey on 25/06/2023.
//

import UIKit
import MapKit

class CustomMapViewController: UIViewController ,MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.mapType = .satellite
        addPins()
        // Do any additional setup after loading the view.
    }
    
    func addPins(){
        let pin = MKPointAnnotation()
        pin.title = "Riyadh"
        pin.subtitle = "Saudia Arabia"
        pin.coordinate = CLLocationCoordinate2D(latitude: 24.686322, longitude: 46.979539)
        
        let pin2 = MKPointAnnotation()
        pin2.title = "Makka"
        pin2.subtitle = "Saudia Arabia"
        pin2.coordinate = CLLocationCoordinate2D(latitude: 21.398083, longitude: 39.840067)
        mapView.addAnnotations([pin,pin2])
        
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "CustomPin")
        switch annotation.title {
        case "Riyadh":
            annotationView.markerTintColor = UIColor.brown
            annotationView.glyphImage = UIImage(named: "ic_riyadh")
            break
        case "Makka":
            annotationView.markerTintColor = UIColor.white
            annotationView.glyphImage = UIImage(named: "ic_mecca")
            annotationView.selectedGlyphImage = UIImage(named: "ic_riyadh")
            annotationView.titleVisibility = .hidden
            break
        default:
            break
        }
       
        return annotationView
    }

}
