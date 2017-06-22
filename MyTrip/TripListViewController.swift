import UIKit
import CoreData

class TripListViewController: UIViewController {
    
    var trips : [NSManagedObject] = []
    
    //will have to send to the new trip builder
    @IBAction func noTripButtonAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "TripName")
        
        self.navigationController?.pushViewController(vc, animated: true)
        
//        let transition = CATransition()
//        transition.duration = 0.25
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromRight
//        view.window!.layer.add(transition, forKey: kCATransition)
//        self.present(vc!, animated: false, completion: nil)
    }
    
    @IBOutlet weak var noTripButton: UIButton!
    @IBOutlet weak var noTripView: UIView!
    @IBOutlet weak var noTripsLabel: UILabel!
    @IBOutlet weak var tripListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripListTableView.dataSource = self
        tripListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        noTripView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Trip")
        do {
            trips = try managedContext.fetch(fetchRequest)
            self.tripListTableView.reloadData()
        } catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        if( trips.count == 0){
            tripListTableView.isHidden = true
            noTripView.isHidden = false
        }
        
    }
}

extension TripListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //will return number of trips
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trip = trips[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = trip.value(forKey: "name") as? String
        return cell
    }
}

extension TripListViewController: UITableViewDelegate{
    
}
