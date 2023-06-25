//
//  AccessUserLocationViewController.swift
//  Map Kit
//
//  Created by Mohamed Elkomey on 24/06/2023.
//

import UIKit
import MapKit
import CoreLocation



class AccessUserLocationViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //to track location in background you must go to blue folder <- cmd shift l then add background modes , check on location updates then \|/
        locationManager.allowsBackgroundLocationUpdates = true
    
    
        if isLocationServiceEnabled(){
            checkAuthorization()
        }else{
            showAlert(msg: "Please,enable location service")
        }
    }
    
    func isLocationServiceEnabled() ->Bool {
        
        return CLLocationManager.locationServicesEnabled()
    }
    
    
    func checkAuthorization(){
        // info.plist -> add  (Privacy - Location When In Use Usage Description - Privacy - Location Always and When In Use //Usage Description) for permissions
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
           break
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
           break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
        case .denied:
            showAlert(msg:" Please authorize location access " )
            locationManager.requestAlwaysAuthorization()
            break
        case .restricted:
            showAlert(msg: "Authorization restricted")
            break
        default:
            print("default...")
        break
        }
    }
    
    func showAlert(msg:String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
//        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: {action in
//            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
//                        return
//                    }
//            if UIApplication.shared.canOpenURL(settingsUrl) {
//                     UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
//                         print("Settings opened: \(success)") // Prints true
//                     })
//                 }
//        }))
        present(alert, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print(location.coordinate)
            zoomToUserLocation(location: location)
        }
        //to stop the unlimited prints
        locationManager.stopUpdatingLocation()
    }
    
    func zoomToUserLocation(location : CLLocation){
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
           break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
        case .denied:
            showAlert(msg:" Please authorize location access " )
            break
        default:
            print("default...")
        break
        }
    }


}
