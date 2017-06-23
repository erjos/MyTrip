//import UIKit
//import CoreData
//
//class TripsViewController: UIViewController {
//    
//    var trips : [NSManagedObject] = []
//
//    @IBOutlet weak var tableView: UITableView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        
//        let managedContext = appDelegate.persistentContainer.viewContext
//        
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Trip")
//        
//        do {
//            trips = try managedContext.fetch(fetchRequest)
//            self.tableView.reloadData()
//        } catch let error as NSError{
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//}
//
//extension TripsViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return trips.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let trip = trips[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        
//        cell.textLabel?.text = trip.value(forKey: "name") as? String
//        return cell
//    }
//}
