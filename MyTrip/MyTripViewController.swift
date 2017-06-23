import UIKit
import CoreData

class MyTripViewController: UIViewController {

    var name: String?
    var placeName: String?
    
    //don't really understand this format, but it matches the fetch request return type
    var myTrip: [NSManagedObject] = []
    
    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var tripLocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func backButtonPressed(_ sender: UIBarButtonItem){
        //performSegue(withIdentifier: "Main", sender: self)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "Main")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Trip")
        
        let predicate = name
        
        fetchRequest.predicate = NSPredicate(format: "name == %@", predicate!)
        
        do {
            myTrip = try managedContext.fetch(fetchRequest)
        } catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        tripName.text = myTrip.first?.value(forKey: "name") as! String?
        tripLocation.text = myTrip.first?.value(forKey: "placeName") as! String?
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
