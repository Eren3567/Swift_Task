//
//  ViewController.swift
//  Map2
//
//  Created by Eren Çetintaş on 25.12.2023.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var isimtext: UITextField!
    
    @IBOutlet weak var AcıklamaText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(konumsec(gestureRecognizer: )))
        gestureRecognizer.minimumPressDuration  = 2
        mapView.addGestureRecognizer(gestureRecognizer)
        
        
       
                
            }
    
    @objc func konumsec(gestureRecognizer : UILongPressGestureRecognizer){
        if gestureRecognizer.state == .began {
            
            let dokulanNokta = gestureRecognizer.location(in: mapView)
            let dokulanKoordinat = mapView.convert(dokulanNokta, toCoordinateFrom: mapView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = dokulanKoordinat
            annotation.title = isimtext.text
            annotation.subtitle = AcıklamaText.text
            mapView.addAnnotation(annotation)
    
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       // print(locations[0].coordinate.latitude)
        //print(locations[0].coordinate.longitude)
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }

}

