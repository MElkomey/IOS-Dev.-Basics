//
//  DirectionsViewController.swift
//  Map Kit
//
//  Created by Mohamed Elkomey on 25/06/2023.
//

import UIKit
import MapKit
import CoreLocation
class DirectionsViewController: UIViewController ,CLLocationManagerDelegate ,MKMapViewDelegate{

    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        if checkLocationServiceEnabled() {
            checkAuthorization()
        }else{
            showAlert(msg: "Please enable location service.")
        }
        
    }
    
    func checkLocationServiceEnabled() ->Bool{
        return CLLocationManager.locationServicesEnabled()
    }
    
    func checkAuthorization(){
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case .restricted:
            showAlert(msg: "Authorization restricted")
            break
        case .denied:
            print("Authorization denied")
            break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            break
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            locationManager.requestAlwaysAuthorization()
            break
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            showAlert(msg: "Authorization restricted")
            break
        case .denied:
            print("Authorization denied")
            break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            break
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            locationManager.requestAlwaysAuthorization()
            break
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
            print(location.coordinate.longitude )
            print(location.coordinate.latitude )
        }
        locationManager.stopUpdatingLocation()
    }
    
    
    func showAlert(msg:String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnGetGirections(_ sender: Any) {
    
        if let userloc = locationManager.location {
            drawDirections(startingLoc: userloc.coordinate, destinationLoc: mapView.centerCoordinate)
        }
    }
    
    func drawDirections(startingLoc : CLLocationCoordinate2D ,destinationLoc: CLLocationCoordinate2D){
        let startingPlace = MKPlacemark(coordinate: startingLoc)
        let destinationPlace = MKPlacemark(coordinate: destinationLoc)
        
        let startingItem = MKMapItem(placemark: startingPlace)
        let destinationItem = MKMapItem(placemark: destinationPlace)
        
        let request = MKDirections.Request()
        request.source = startingItem
        request.destination = destinationItem
        request.transportType = .automobile
       // request.requestsAlternateRoutes = true  //multible routes
        
        let directions = MKDirections(request: request)
        directions.calculate {( response, error) in
            guard let response = response else{
                if let error = error {
                    print("direstion error \(error.localizedDescription)")
                }
                return
            }
            
            for route in response.routes {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
            
        }
        
    }
    
    // to draw the line you calculated and added to map overlay
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as!MKPolyline)
        renderer.strokeColor = UIColor.blue
        //renderer.lineWidth = 0.2
        return renderer
    }

}
