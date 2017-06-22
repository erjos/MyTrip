import UIKit
import GooglePlaces

class TripNameViewController: UIViewController {
    @IBOutlet weak var backButton: UIImageView!
    
    @IBOutlet weak var tripNameEntry: UITextField!
    
    @IBAction func nextButtonAction(_ sender: Any) {
    }
    //this prepares for any segue > would need additional logic to specify the segue if more than one exist
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "NameToLocation"){
            let controller = segue.destination as! LocationViewController
            controller.tripName = tripNameEntry.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

