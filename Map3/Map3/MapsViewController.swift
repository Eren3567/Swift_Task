//
//  ViewController.swift
//  Map2
//
//  Created by Eren Çetintaş on 25.12.2023.
//

import UIKit
import MapKit
import CoreData
class MapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var MapVieww: MKMapView!
    @IBOutlet weak var adtext: UITextField!
    
    @IBOutlet weak var AcıklamaText: UITextField!
    var locationManager = CLLocationManager()
    
    var secilenLatitude = Double()
    var secilenLongtitude = Double()
    var secilenisim = ""
    var secilenId : UUID?
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MapVieww.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(konumsec(gestureRecognizer: )))
        gestureRecognizer.minimumPressDuration  = 2
        MapVieww.addGestureRecognizer(gestureRecognizer)
        
        
        if secilenisim != "" {
            // Core Data dan verileri çek
            
            if let uuidString = secilenId?.uuidString{
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Yer")
                print(uuidString)
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsObjectsAsFaults  = false
                
                do {
                    let sonuclar = try context.fetch(fetchRequest)
                    if sonuclar.count > 0 {
                        for sonuc in sonuclar as! [ NSManagedObject]{
                            
                            if let isim = sonuc.value(forKey: "ad") as? String{
                                
                                annotationTitle = isim
                                if let aciklama = sonuc.value(forKey: "aciklama") as? String {
                                    
                                    annotationSubtitle = aciklama
                                    if let latitude = sonuc.value(forKey: "latitude") as? Double {
                                        
                                        annotationLatitude = latitude
                                        if let longitude = sonuc.value(forKey: "lognitute") as? Double {
                                            annotationLongitude = longitude
                                            
                                            let annotation = MKPointAnnotation()
                                            annotation.title = annotationTitle
                                            annotation.subtitle = annotationSubtitle
                                            let coordinate = CLLocationCoordinate2D(latitude: annotationLatitude, longitude: annotationLongitude)
                                            annotation.coordinate = coordinate
                                            MapVieww.addAnnotation(annotation)
                                            adtext.text = annotationTitle
                                            AcıklamaText.text = annotationSubtitle
                                        }
                                        
                                    }
                                    
                                }
                            }
                            
                            
                            
                        }
                    }
                }
                catch {
                    // yeni veri eklemeye geldi
                    print("Hata")
                }
                
            }
        }
    }
            func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
                if annotation is MKUserLocation{
                    return nil
                }
                let reuseId = "myAnnotation"
                var pinView = MapVieww.dequeueReusableAnnotationView(withIdentifier: reuseId)
                
                if pinView == nil {
                    pinView  = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                    pinView?.canShowCallout = true
                    pinView?.tintColor = .blue
                    
                    let button = UIButton(type: .detailDisclosure)
                    pinView?.rightCalloutAccessoryView = button
                    
                }else {
                    pinView?.annotation = annotation
                    
                }
                return pinView
            }
  @objc func konumsec(gestureRecognizer : UILongPressGestureRecognizer){
                if gestureRecognizer.state == .began {
                    
                    let dokulanNokta = gestureRecognizer.location(in: MapVieww)
                    let dokulanKoordinat = MapVieww.convert(dokulanNokta, toCoordinateFrom: MapVieww)
                    secilenLatitude = dokulanKoordinat.latitude
                    secilenLongtitude = dokulanKoordinat.longitude
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = dokulanKoordinat
                    annotation.title = adtext.text
                    annotation.subtitle = AcıklamaText.text
                    MapVieww.addAnnotation(annotation)
                    
                }
                
            }
            func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                // print(locations[0].coordinate.latitude)
                //print(locations[0].coordinate.longitude)
                
                let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: location, span: span)
                MapVieww.setRegion(region, animated: true)
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
                
                NotificationCenter.default.post(name: NSNotification.Name("YeniYerOlusturuldu"), object: nil)
                navigationController?.popViewController(animated: true)
            }
        }
        


