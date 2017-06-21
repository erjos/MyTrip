import UIKit
import CoreData

class TripListViewController: UIViewController {
    
    var trips : [NSManagedObject] = []
    
    @IBOutlet weak var noTripsLabel: UILabel!
    @IBOutlet weak var tripListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripListTableView.dataSource = self
        tripListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        noTripsLabel.isHidden = true
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
            noTripsLabel.isHidden = false
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
