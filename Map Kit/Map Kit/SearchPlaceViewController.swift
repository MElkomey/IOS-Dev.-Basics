//
//  SearchPlaceViewController.swift
//  Map Kit
//
//  Created by Mohamed Elkomey on 24/06/2023.
//

import UIKit
import MapKit

class SearchPlaceViewController: UIViewController {
    @IBOutlet weak var txtFieldDestination: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnSearch(_ sender: Any) {
        if txtFieldDestination.text != "" {
            searchForDestination(destination: txtFieldDestination.text!)
        }else{
            showAlert(msg: "Please enter your destination")
        }
    }
    
    func searchForDestination(destination: String){
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(destination) { places, error in
           
            guard let places = places , error == nil else{
                self.showAlert(msg: "No such location")
                return}
            guard let place1 = places.first else{return}
            
            self.mapView.region = MKCoordinateRegion(center: place1.location!.coordinate, latitudinalMeters: 30000, longitudinalMeters: 30000)
            
            for place in places{
                let pin = MKPointAnnotation()
                pin.coordinate = place.location!.coordinate
                pin.title = place.name
                pin.subtitle = place.country
                self.mapView.addAnnotation(pin)
            }
            self.txtFieldDestination.text = ""
        }
    }
    
    func showAlert(msg:String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
