import UIKit
import GooglePlaces

class LocationViewController: UIViewController {
    
    var tripName: String?
    var place: GMSPlace?

    @IBOutlet weak var tripNameLabel: UILabel!
    @IBAction func SearchLocation(_ sender: UIButton) {
        openGooglePlacesForm()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Finish"){
            let controller = segue.destination as! FinishViewController
            controller.name = self.tripName
            controller.placeName = self.place?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripNameLabel.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tripNameLabel.text = tripName
        tripNameLabel.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openGooglePlacesForm(){
        
        let autocompleteController = GMSAutocompleteViewController()
        
        //this line requires the extension of the delegate protocol
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
        
    }
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
        
        self.place = place
        
       
        performSegue(withIdentifier: "Finish", sender: self)
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
