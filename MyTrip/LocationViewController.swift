//
//  LocationViewController.swift
//  MyTrip
//
//  Created by Joseph, Ethan on 5/9/17.
//  Copyright © 2017 Joseph, Ethan. All rights reserved.
//

import UIKit
import GooglePlaces

class LocationViewController: UIViewController {
    
    @IBOutlet weak var placeID: UILabel!
    @IBOutlet weak var placeCoordinate: UILabel!
    @IBOutlet weak var placeName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let autocompleteController = GMSAutocompleteViewController()
        
        //this line requires the extension of the delegate protocol
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
        
        placeID.isHidden = true
        placeCoordinate.isHidden = true
        placeName.isHidden = true
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension LocationViewController: GMSAutocompleteViewControllerDelegate{
    // Handle the user's selection.
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        print("Place coordinate: \(place.coordinate)")
        print("Place ID: \(place.placeID)")
        dismiss(animated: true, completion: nil)
        
//        let trip = Trip(trip: place)
        
        placeID.text = place.placeID
        placeCoordinate.text = String(describing: place.coordinate)
        placeName.text = place.name
        
        placeID.isHidden = false
        placeCoordinate.isHidden = false
        placeName.isHidden = false
        
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
