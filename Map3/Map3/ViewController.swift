//
//  ViewController.swift
//  Map2
//
//  Created by Eren Çetintaş on 25.12.2023.
//

import UIKit
import MapKit
import CoreData
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var adtext: UITextField!
    
    @IBOutlet weak var AcıklamaText: UITextField!
    var locationManager = CLLocationManager()
    
    var secilenLatitude = Double()
    var secilenLongtitude = Double()
    
    
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
            secilenLatitude = dokulanKoordinat.latitude
            secilenLongtitude = dokulanKoordinat.longitude
            let annotation = MKPointAnnotation()
            annotation.coordinate = dokulanKoordinat
            annotation.title = adtext.text
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

    @IBAction func kaydetButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let yeniyer = NSEntityDescription.insertNewObject(forEntityName: "Yer", into: context)
        
        yeniyer.setValue(adtext.text, forKey: "ad")
        yeniyer.setValue(adtext.text, forKey: "aciklama")
        
        yeniyer.setValue(secilenLatitude, forKey: "latitude")
        
        yeniyer.setValue(secilenLongtitude, forKey: "lognitute")
        
        yeniyer.setValue(UUID(), forKey: "id")
        do{
            try context.save()
            print("kayıt oldu")
            
        }
        catch{ print("hata")
            
        }
    }
}


