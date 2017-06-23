import UIKit
import GooglePlaces

class TripNameViewController: UIViewController {
    
    @IBOutlet weak var tripNameEntry: UITextField!
    
    @IBAction func nextButtonAction(_ sender: Any) {
    }
    
    //this prepares for any segue > would need additional logic to specify the segue if more than one exist
    
    //this won't work anymore, will need to recreate the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Location"){
            let controller = segue.destination as! LocationViewController
            controller.tripName = tripNameEntry.text
        }
    }
    
//    func handleBackButtonTap(_ sender: UITapGestureRecognizer){
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateInitialViewController()
//        let transition = CATransition()
//        transition.duration = 0.25
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromLeft
//        view.window!.layer.add(transition, forKey: kCATransition)
//        self.present(vc!, animated: false, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
//        let backImage = UIImage(named: "BackIconWhite")
//        
//        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(self.handleBackButton))
        
        //Image is way to large - need to figure out how to size this appropriately
        //(image: backImage, style: .plain, target: self, action: #selector(self.handleBackButton))
        
        //self.navigationItem.leftBarButtonItem?.title = ""
        //self.navigationItem.leftBarButtonItem?.action = #selector(self.handleBackButton)
        
        //self.navigationController?.navigationItem.leftBarButtonItem?.title = ""
        
        self.navigationController?.navigationBar.backItem?.title = ""
        
        //self.navigationItem.leftBarButtonItem = backButton
    }
    
    func handleBackButton(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

