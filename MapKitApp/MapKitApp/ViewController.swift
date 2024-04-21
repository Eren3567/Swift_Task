//
//  ViewController.swift
//  MapKitApp
//
//  Created by Eren Çetintaş on 22.02.2024.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager : CLLocationManager = CLLocationManager()
    @IBOutlet weak var mapKit: MKMapView!
    
    
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        
    }


}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation : CLLocation = locations[locations.count-1]
        print(lastLocation.coordinate.latitude)
        Label1.text = String(lastLocation.coordinate.latitude)
        Label2.text = String(lastLocation.coordinate.longitude)
        Label3.text = String(lastLocation.speed)
        let Location = CLLocationCoordinate2D(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: Location, span: span)
        
        mapKit.setRegion(region, animated: true)
        mapKit.showsUserLocation = true
    }
    }
    
    
    

