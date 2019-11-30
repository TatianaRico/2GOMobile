//
//  MapViewController.swift
//  2GO
//
//  Created by Tatiana Rico on 17/10/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var localSp: Business?
    let regionradius: CLLocationDistance = 1000
    let locationManager: CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var voltarButton: UIButton!
    private var categoria: Localizacao?
    
    let event  = EventProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let latitude = localSp?.coordinates.latitude, let longitude = localSp?.coordinates.longitude {
            self.voltarButton.isHidden = false
            self.centerLocation(location: CLLocation(latitude: latitude, longitude: longitude))
        }else {
            self.voltarButton.isHidden = true
            self.carregarLocais()
        }
    }
    @IBAction func voltarButton(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func centerLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionradius, longitudinalMeters: regionradius)
        self.mapView.setRegion(coordinateRegion, animated: true)
        
        if let local = self.localSp,
           let annotation = self.addAnnotation(local) {
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func addAnnotation(_ local: Business) -> MKAnnotation? {
        
        guard let categoryName = local.categories.first?.title else {
            return nil
        }
        
        let annotation: MKAnnotation = Annotation(title: local.name, subtitle: "",
                                                  category: categoryName,
                                                  coordinate: CLLocationCoordinate2D(latitude: local.coordinates.latitude, longitude: local.coordinates.longitude))
        
        return annotation
    }

    func checkLocationAuthorizationStatus() {
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            self.mapView.showsUserLocation = true
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func carregarLocais() {
        
        self.event.alamofireEvent { (event, success) in
            self.categoria = event
            self.carregarPinosNoMapa()
        }
        
    }
    
    func carregarPinosNoMapa() {
        
        guard let locais = self.categoria?.businesses, locais.count > 0 else {
            return
        }
        
        var arrayLocais: [MKAnnotation] = []
        
        locais.forEach { local in
            if let annotation = self.addAnnotation(local) {
                
                arrayLocais.append(annotation)

            }
        }
        
        self.mapView.addAnnotations(arrayLocais)
        self.mapView.showAnnotations(arrayLocais, animated: true)
        
    }

}

class Annotation: NSObject, MKAnnotation {
    
    let title: String?
    let subtitle: String?
    let category: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, category: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.category = category
        self.coordinate = coordinate
        
        super.init()
    }
    
    init(json: [String: String]) {
        
        //1
        self.title = json["title"] ?? "No Title"
        self.subtitle = json["subtitle"]
        self.category = json["category"]
        // 2
        if let latitude = Double(json["lat"] ?? ""),
            let longitude = Double(json["lng"] ?? "") {
            self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        } else {
            self.coordinate = CLLocationCoordinate2D()
        }
        
        
        
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        checkLocationAuthorizationStatus()
    }
}




