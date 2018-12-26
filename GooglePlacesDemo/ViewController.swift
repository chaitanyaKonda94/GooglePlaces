//
//  ViewController.swift
//  GooglePlacesDemo
//
//  Created by SMSCountry Networks Pvt. Ltd on 03/10/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate
  {
    
 
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    var strofClinincLatitude : String! = ""
    @IBOutlet var googleMapsContainerView: UIView!
    var strofClinincLongitude : String! = ""
    
     var locationManager = CLLocationManager()
    var googleMapsView:GMSMapView!
    var gmsFetcher: GMSAutocompleteFetcher!
    var searchController: UISearchController?
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
        navigationController?.isNavigationBarHidden = false
        print(L102Language.currentAppleLanguage())
     
    }
    
    func startLocationUpdates(){
        if locationManager != nil {
            locationManager.startUpdatingLocation()
        }
        
        /////
    }
    
    
    
    // Add a UIButton in Interface Builder, and connect the action to this function.
    @IBAction func getCurrentPlace(_ sender: UIButton) {
        
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        //autocompleteController.accessibilityLanguage = "en"
       
//        UINavigationBar.appearance().barTintColor = UIColor(red: 44.0/255, green: 44.0/255, blue: 49.0/255, alpha: 1.0)
//        UINavigationBar.appearance().tintColor = UIColor.white
//
//
//        UISearchBar.appearance().barStyle = UIBarStyle.default

       

        
        // Set a filter to return only addresses.
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        autocompleteController.autocompleteFilter = filter
        // filter.accessibilityLanguage = "en"
        
      
        
        present(autocompleteController, animated: true, completion: nil)
    }
    
     @IBAction func getCurrentLocation(_ sender: UIButton) {
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
       @IBAction func matBtnTapped(_ sender: UIButton) {
        
//        let mapVC = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
//        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    

    //MARK: - location delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      //  let userLocation :CLLocation = locations[0] as CLLocation
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
        
//        print("user latitude = \(userLocation.coordinate.latitude)")
//        print("user longitude = \(userLocation.coordinate.longitude)")
        
//         let lat = "\(userLocation.coordinate.latitude)"
//        let long = "\(userLocation.coordinate.longitude)"
        
//        let geocoder = CLGeocoder()
//        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
//            if (error != nil){
//                print("error in reverseGeocode")
//            }
//            let placemark = placemarks! as [CLPlacemark]
//            if placemark.count>0{
//                let placemark = placemarks![0]
//                print(placemark.locality!)
//                print(placemark.administrativeArea!)
//                print(placemark.country!)
//
//                self.nameLabel.text = "\(placemark.locality!), \(placemark.administrativeArea!), \(placemark.country!)"
//            }
//        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}


extension ViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        // Print place info to the console.
//        print("Place name: \(place.name)")
//        print("Place address: \(String(describing: place.formattedAddress))")
//        print("Place attributions: \(String(describing: place.attributions))")
        
        
        strofClinincLatitude = String(describing:place.coordinate.latitude)
        strofClinincLongitude = String(describing:place.coordinate.longitude)
       
        place.accessibilityLanguage = "en"
    
        addressLabel.text = String(describing:place.name)
        print("Place address: \(String(describing: place.name))")
        dismiss(animated: true, completion: nil)
       
       
        
        
        // TODO: Add code to get address components from the selected place.
        
        // Close the autocomplete widget.
        dismiss(animated: true, completion: nil)
        
      
        
    }
    
    
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Show the network activity indicator.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    // Hide the network activity indicator.
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    
}
