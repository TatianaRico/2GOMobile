//
//  DetalheRotaMapViewController.swift
//  2GO
//
//  Created by Tatiana Rico on 04/12/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import UIKit
import MapKit

class DetalheRotaMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var rotaButton: UIButton!
    
    var localSp: Business?
    var minhaRota : MKRoute!
    let regionradius: CLLocationDistance = 1000
    let locationManager: CLLocationManager = CLLocationManager()
    var myLocalation: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rotaButton.layer.cornerRadius = rotaButton.frame.size.height/2
        self.rotaButton.clipsToBounds = true
        checkLocationAuthorizationStatus()
    }
    
    @IBAction func fazerRota(_ sender: UIButton) {
        let destination = CLLocationCoordinate2DMake(localSp?.coordinates.latitude ?? 0, localSp?.coordinates.longitude ?? 0)
        openWaze(location: destination)
    }
    
    @IBAction func btnVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func checkLocationAuthorizationStatus() {
        self.locationManager.delegate = self
        self.mapView.delegate = self
        self.locationManager.startUpdatingLocation()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            self.mapView.showsUserLocation = true
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func openWaze(location : CLLocationCoordinate2D) {
        if UIApplication.shared.canOpenURL(URL(string: "waze://")!) {
            let urlStr: String = "waze://?ll=\(location.latitude),\(location.longitude)&navigate=yes"
            UIApplication.shared.open(URL(string: urlStr)!)
        }
        else {
            UIApplication.shared.open(URL(string: "http://itunes.apple.com/us/app/id323229106")!)
        }
    }
    
    func centerLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionradius, longitudinalMeters: regionradius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func criarPreviewDeRota() {
        let criarDirecao = MKDirections.Request()
        let meuLocal = MKPlacemark(coordinate: CLLocationCoordinate2DMake(myLocalation?.latitude ?? 0, myLocalation?.longitude ?? 0), addressDictionary: nil)
        let localDoRestaurante = MKPlacemark(coordinate: CLLocationCoordinate2DMake(localSp?.coordinates.latitude ?? 0, localSp?.coordinates.longitude ?? 0), addressDictionary: nil)
        criarDirecao.source = MKMapItem(placemark: meuLocal)
        criarDirecao.destination = MKMapItem(placemark: localDoRestaurante)
        criarDirecao.transportType = MKDirectionsTransportType.automobile
        
        let direcao = MKDirections(request: criarDirecao)
        direcao.calculate(completionHandler: { response, error in
            if error == nil {
                self.minhaRota = response!.routes[0] as MKRoute
                self.mapView.addOverlay(self.minhaRota.polyline)
            }
        })
    }
}

extension DetalheRotaMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) ->MKOverlayRenderer {
        let desenhoParaRota = MKPolylineRenderer(polyline: minhaRota.polyline)
        desenhoParaRota.strokeColor = UIColor.red
        desenhoParaRota.lineWidth = 3
        return desenhoParaRota
    }
}

extension DetalheRotaMapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        myLocalation = manager.location?.coordinate
        centerLocation(location: manager.location!)
        criarPreviewDeRota()
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
        } else {
            checkLocationAuthorizationStatus()
        }
    }
}
