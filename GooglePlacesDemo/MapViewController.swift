//
//  MapViewController.swift
//  GooglePlacesDemo
//
//  Created by SMSCountry Networks Pvt. Ltd on 04/10/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController {
    
  

    @IBOutlet weak var theMap: GMSMapView!
    @IBOutlet weak var addressLabel: UILabel!


    var locationManager = CLLocationManager()
    var currentLocation : CLLocationCoordinate2D = CLLocationCoordinate2D.init()
    let zoomLevel : Float = 16.0



    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.delegate = self as? CLLocationManagerDelegate
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()

        let camera = GMSCameraPosition.camera(withLatitude: (self.locationManager.location?.coordinate.latitude)! ,longitude: (self.locationManager.location?.coordinate.longitude)!, zoom: 7)
        self.theMap.camera = camera
        theMap.settings.myLocationButton = true
        theMap.settings.compassButton = true
        theMap.isMyLocationEnabled = true
        theMap.delegate = self as? GMSMapViewDelegate
        theMap.mapType = .normal

        let marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "Current Location"
        marker.map = theMap

    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.theMap?.settings.myLocationButton = true
        self.theMap?.isMyLocationEnabled = true
        self.locationManager.startUpdatingLocation()
    }

}





//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let camera = GMSCameraPosition.camera(withTarget: currentLocation, zoom: zoomLevel)
//        self.theMap.camera = camera
//        theMap.settings.myLocationButton = true
//        theMap.settings.compassButton = true
//        theMap.isMyLocationEnabled = true
//        theMap.delegate = self as? GMSMapViewDelegate
//
//}
//
    
    
//}





