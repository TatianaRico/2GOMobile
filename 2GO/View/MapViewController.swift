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
    
    let regionradius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: -23.5654197, longitude: -45.6545216)

        let london = MKPointAnnotation()
        london.title = "London"
        london.coordinate = CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)
        mapView.addAnnotation(london)
     
        let location1 = MKPointAnnotation()
             location1.title = "location1"
             location1.coordinate = CLLocationCoordinate2D(latitude: -23.5654197, longitude: -45.6545216)
             mapView.addAnnotation(location1)
        
        self.centerLocation(location: initialLocation)
//        self.loadInitialData()
        
        self.checkLocationAuthorizationStatus()

        // Do any additional setup after loading the view.
    }
    
    func centerLocation(location: CLLocation) {
            
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionradius, longitudinalMeters: regionradius)
            
            self.mapView.setRegion(coordinateRegion, animated: true)
            
        }

//        func loadInitialData()-> [Localizacao] {
//
//              var arrayLocals:[Localizacao] = []
//              if let path = Bundle.main.path(forResource: "localizacao", ofType: "json") {
//                  do {
//                      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                      let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//
//                      if let _jsonResult = jsonResult as? [[String:String]]{
//
//                          for value in _jsonResult {
//                              let currentLocal = Localizacao(json: value)
//                              arrayLocals.append(currentLocal)
//                          }
//
//                          // do stuff
//                      }
//                  } catch {
//                      // handle error
//                  }
//              }
//
//              return arrayLocals
//          }
        
        let locationManager: CLLocationManager = CLLocationManager()
        
        func checkLocationAuthorizationStatus() {
            
            self.locationManager.delegate = self
            self.locationManager.startUpdatingLocation()
            
            if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                self.mapView.showsUserLocation = true
            } else {
                
                self.locationManager.requestWhenInUseAuthorization()
            }
            
        }

    }

    extension MapViewController: CLLocationManagerDelegate {
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            checkLocationAuthorizationStatus()
        }
    }




